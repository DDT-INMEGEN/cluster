#
#   This script makes sure we are ready to mount using autofs.
#   In order to do that, we test the following four points:
#
#
#   1. The directory is not listed in /etc/fstab
#
#   2. Autofs is installed.
#
#   3. The mountpoints are configured
#      but we did not configure a local mountpoint as a remote one
#
#   4.  The mounpoint is currently not mounted
#
#   Only then we can start autofs service
#
main() {
    clean_remote_mountpoints \
    && install_autofs \
    && configure_auto_mountpoints \
    && disable_mountpoints \
    && start_autofs
}

#   The first test is implemented by removing all nfs mountpoints:
#
clean_remote_mountpoints() {
#-----------------------
#
#  The files are declared as a posix requirement on the
   local FILE="/etc/fstab"
#
#  So we remove every nfs reference from that file
#  and replace it atomically on success.
#
   grep -v -e nfs "${FILE}" > "${FILE}.new" \
   && mv "${FILE}.new" "${FILE}"
}
#
install_autofs() {
#-------------
#
#   To make sure we installed autofs,
#   we just execute the  instalation command
#
    apt install autofs
}
#
#   We can now continue to
#
configure_auto_mountpoints() {
#-------------------------
#
#   We configured all the posible mountpoints at this
    local TEMPLATE="/etc/cluster/automount/direct.map"
#
#   And the place where autofs reads it's instructions is the
    CONFIG_FILE="/etc/auto.master.d/direct.map"
#
#   We make sure we have a directory to store the config file
#
    mkdir -p "$(dirname ${CONFIG_FILE})"
#
#   To make sure we do not automount local mountpoints,
#   we use the external command `remove-self-references`
#   which is part of this git repository and it's located at
#   `/etc/cluster/scripts`.
#
#   We replace atomically the content of the file on success.
#
    remove-self-references "${TEMPLATE}" \
    > "${CONFIG_FILE}.new" \
    && mv "${CONFIG_FILE}.new" "${CONFIG_FILE}"
}
#
#   Now we have made sure the local filename is not configured we can
#
disable_mountpoints() {
#------------------
#
#   We find the mountponts configured on our CONFIG_FILE and:
#
    for  fs in $(awk '{print $1}' "${CONFIG_FILE}"); do
#
#     - Verify no process is executing on the filesystem:
#
        fuser  -m -k "${fs}"
#
#     - Unmount the filesystem:
#
        umount "${fs}"
#
#     - And if the directory is not empty, we move it to a new location
#       because autofs creates an infinite loop when trying to mount
#       non–empty locations
#
        directory_not_empty "${fs}" \
        && mv "${fs}" "${fs}.old"
#
    done
}
#
#   The test for the non–empty directory is implemented here
#
directory_not_empty() {
#-------------------
#
#   The directory to be tested is given as an argument and stored as the
    local test_directory="${1}"
#
#   We use find to locate a non–empty location on the current directory.
#   As find always exits 0 if the test were succesfuly executed,
#   we use grep to verify whether the directory is really not empty.
#
    find "${test_directory}" -maxdepth 0 -type d '!' -empty \
    | grep "${test_directory}" \
    > /dev/null
}
#
start_autofs() {
#------------
#
#   We start autofs using systemctl,
#   as we have already provided a `/etc/systemd/system/autofs.service`
#   in this git repository.
#
    systemctl start autofs
}

main "${@}"

#! /bin/bash

# pack a directory as a .tar.xz file and create a sha256 checksum

# target name given as a command arguement
target_name=$1

echo -e "Creating Tar...\n"
# create the tar file
tar -cvf "${target_name}.tar" "${target_name}"

echo -e "Compressing with xz with 12G limit...\n"
# xz compression
xz -T0 -v --best --memlimit-compress=12G "${target_name}.tar"

echo -e "Creating sha256 checksum file...\n"
# create 256 checksum file
sha256sum "${target_name}.tar.xz" > "${target_name}.tar.xz.sha256"

echo -e "Verifying sha256 checksum file...\n"
# verify checksum
sha256sum "${target_name}.tar.xz.sha256"
sha256sum -c "${target_name}.tar.xz.sha256"

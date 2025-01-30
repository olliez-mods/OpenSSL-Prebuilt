#!/bin/bash
set -e

# ================== NEED TO BE RUN ON UBUNTU ==================
# Needed packages (apt-get install):
# g++ make cmake wget git mingw-w64 mingw-w64-tools
# gcc-mingw-w64-x86-64 g++-mingw-w64-x86-64 openssl libssl-dev ca-certificates
# =============================================================

# ================== DEFINE THE VERSION AND ARCHITECTURE HERE ==================
OPENSSL_VERSION="openssl-3.0.15"
ARCH="x86_64" # Change to "i686" for 32-bit
# =============================================================

# Validate architecture
if [ "$ARCH" != "x86_64" ] && [ "$ARCH" != "i686" ]; then
    echo "Error: ARCH must be either 'x86_64' or 'i686'."
    exit 1
fi

# Start...
echo Building ${OPENSSL_VERSION} for ${ARCH}...
echo

echo Deleting old files...
rm -rf ${OPENSSL_VERSION}-${ARCH}
rm -rf ${OPENSSL_VERSION}.tar.gz
echo

# All left over files (source and precomp) will be stored in this folder
mkdir ${OPENSSL_VERSION}-${ARCH}
cd ${OPENSSL_VERSION}-${ARCH}

# Download OpenSSL
echo "Downloading ${OPENSSL_VERSION}..."
wget https://www.openssl.org/source/${OPENSSL_VERSION}.tar.gz
echo

# Download, extract and move OpenSSL
echo "Extracting OpenSSL..."
tar -xzvf ${OPENSSL_VERSION}.tar.gz
rm -rf ${OPENSSL_VERSION}.tar.gz
mv ${OPENSSL_VERSION} source # This sometimes fails, but it's not a problem, run the script again
echo

# Configure and build OpenSSL, using local install directory
echo "Configuring and building OpenSSL..."
mkdir precomp
cd source
if [ "$ARCH" == "x86_64" ]; then
    ./Configure mingw64 no-shared --cross-compile-prefix=x86_64-w64-mingw32- --prefix=$(pwd)/../precomp
else
    ./Configure mingw no-shared --cross-compile-prefix=i686-w64-mingw32- --prefix=$(pwd)/../precomp
fi
make && make install
echo

echo Done!
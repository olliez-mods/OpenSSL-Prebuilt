# OpenSSL-Prebuilt
OpenSSL prebuilt for Windows 32/64 with MinGW

The prebuilts were built with WSL-Ubuntu.

## Building OpenSSL

This repository also includes a script to build OpenSSL for Windows using MinGW on Ubuntu. The script automates the process of downloading, extracting, configuring, and building OpenSSL.

### Prerequisites

Ensure you have the following packages installed on your Ubuntu system:

```
sudo apt-get install g++ make cmake wget git mingw-w64 mingw-w64-tools gcc-mingw-w64-x86-64 g++-mingw-w64-x86-64 openssl libssl-dev ca-certificates
```

### Build Instructions

1. Clone this repository:
    ```
    git clone https://github.com/olliez-mods/OpenSSL-Prebuilt
    cd OpenSSL-Libs
    ```

2. Edit 'download-and-compile.sh' to set the desired version and architecture of OpenSSL
    ```
    OPENSSL_VERSION="openssl-3.0.15"
    ARCH="x86_64" # Change to "i686" for 32-bit
    ```

3. Run the build script using Ubuntu/WSL/Docker (Make sure carrege returns are handled):
    ```
    sudo ./download-and-compile.sh
    ```

The script will download the specified version of OpenSSL, extract it, and build it using MinGW.

### Script Details

The script performs the following steps:
1. Deletes any old files from previous builds.
2. Creates a directory for the new build.
3. Downloads the specified version of OpenSSL.
4. Extracts the downloaded tarball.
5. Configures and builds OpenSSL using MinGW.

For more details, refer to the `download-and-compile.sh` script in this repository.

### Prebuilt Binaries

You can download the prebuilt binaries from the releases section:
# 64-bit:
- [3.2.3 - OpenSSL](https://github.com/olliez-mods/OpenSSL-Prebuilt/releases/tag/3.2.3-x86_64)
- [3.1.7 - OpenSSL](https://github.com/olliez-mods/OpenSSL-Prebuilt/releases/tag/3.1.7-x86_64)
- [3.0.15 - OpenSSL](https://github.com/olliez-mods/OpenSSL-Prebuilt/releases/tag/3.0.15-x86_64)
  
# 32-bit
- [3.2.3 - OpenSSL](https://github.com/olliez-mods/OpenSSL-Prebuilt/releases/tag/3.2.3-i686)
- [3.1.7 - OpenSSL](https://github.com/olliez-mods/OpenSSL-Prebuilt/releases/tag/3.1.7-i686)
- [3.0.15 - OpenSSL](https://github.com/olliez-mods/OpenSSL-Prebuilt/releases/tag/3.0.15-i686)

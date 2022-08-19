![GitHub release (latest by date)](https://img.shields.io/github/v/release/Sound-Linux-More/lossywav-for-linux)
![GitHub Release Date](https://img.shields.io/github/release-date/Sound-Linux-More/lossywav-for-linux)
![GitHub repo size](https://img.shields.io/github/repo-size/Sound-Linux-More/lossywav-for-linux)
![GitHub all releases](https://img.shields.io/github/downloads/Sound-Linux-More/lossywav-for-linux/total)
![GitHub](https://img.shields.io/github/license/Sound-Linux-More/lossywav-for-linux)

# Note
![label](lossyWAV.png)  
This is the `README` of **lossyWAV for POSIX**.  
The README of lossyWAV (proper) was moved to [README.lossyWAV.md](README.lossyWAV.md).

# lossyWAV for POSIX

This is an attempt to build lossyWAV natively in POSIX systems.

The Windows API is used in the official lossyWAV sources. But not extensively.
lossyWAV is only offered as Windows binaries or source files which can't be
compiled and linked to run in any non-Windows environment natively.

Luckily, I was able to replace the instances where the Windows API is used
with C++11-compliant or POSIX-compliant code that provides similar
functionality.

None of the changes would be enabled at the preprocessing stage if `_WIN32` is
defined.

**Tested platforms**: GNU/Linux, OSX, FreeBSD, NetBSD, OpenBSD(needs latest eg++).

# How to Build

## General

Building lossywav should be as simple as:

```
make
```

# Credits
* All lossyWAV authors and contributors.
* HydrogenAudio community.

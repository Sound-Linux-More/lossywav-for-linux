# Note
This is the `README` of **lossyWAV for POSIX**.
The README of lossyWAV (proper) was moved to  `README.lossyWAV.md`.

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

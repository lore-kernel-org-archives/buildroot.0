From: Jens Kleintje <scooby22@web.de>
Date: Mon, 11 Nov 2019 17:24:07 +0100
Subject: [Buildroot] [PATCH v1 0/2] package/gcnano-binaries: new package
Message-ID: <20191111162409.24361-1-scooby22@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The package is tested with the following steps:
modprobe galcore
export QT_QPA_EGLFS_ALWAYS_SET_MODE=1

With QT_QPA_EGLFS_ALWAYS_SET_MODE=1 qt performs a video mode set
on every application startup.


Changes:
- Add Signed-off-by line
- Add package/gcnano-binaries/Config.in file
- Add DEVELOPERS file
- Remove default extract commands from GCNANO_BINARIES_EXTRACT_HELPER
- factorize INSTALL commands
- keep wayland-egl.pc and libwayland-egl.so files from wayland package
- Add dependency arm
- cleaning check-package warnings

Keeping git method, because github method does not provide the correct
tarball.

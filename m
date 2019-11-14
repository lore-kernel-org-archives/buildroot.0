From: Jens Kleintje <scooby22@web.de>
Date: Thu, 14 Nov 2019 09:55:27 +0100
Subject: [Buildroot] GIT: [PATCH v2 0/2] package/gcnano-binaries: new package
Message-ID: <20191114085529.733-1-scooby22@web.de>
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

Changes v1 -> v2:
- use the "github" helper macro
- change hash for gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed.tar.gz

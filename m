From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Nov 2013 23:55:33 +0100
Subject: [Buildroot] [git commit] package/rpi-userland: bump
Message-ID: <20131105231347.8623F9BA7A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b6cc2f457dd433014630083fc6c1fcec48a22a34
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes for camera features (exposure, capture loop, shutter speed),
h264 encoding headers, EXIF thumbnails.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpi-userland/rpi-userland.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 9f20766..9320ecf 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = 77d32cd6b7d1c586877b0e05f941e647e35084bc
+RPI_USERLAND_VERSION = 0d25e71ea558f32cd72b8d46cd51767c92a81d01
 RPI_USERLAND_SITE = http://github.com/raspberrypi/userland/tarball/$(RPI_USERLAND_VERSION)
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE

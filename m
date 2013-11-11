From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Nov 2013 01:17:51 +0100
Subject: [Buildroot] [git commit] package/rpi-userland: bump version
Message-ID: <20131111001829.2F1FF9B8FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=381e215d49c94abc298997d01ca7360e2c2f7f7a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump for a few more options (eg. setting the palette in 4- or 8bpp,
and rendering camera preview with GL).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpi-userland/rpi-userland.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 9320ecf..1741153 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = 0d25e71ea558f32cd72b8d46cd51767c92a81d01
+RPI_USERLAND_VERSION = 0d486513f56453f8203c270fcad0b04f8e4f1fee
 RPI_USERLAND_SITE = http://github.com/raspberrypi/userland/tarball/$(RPI_USERLAND_VERSION)
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE

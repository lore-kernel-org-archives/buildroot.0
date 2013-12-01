From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Dec 2013 23:50:58 +0100
Subject: [Buildroot] [git commit] package/rpi-userland: bump for misc fixes
Message-ID: <20131201225157.A8B739BBE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=720ef0c1db8a00c35d6cbdc81f49269e22d5a8c9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes for:
  - video encoder I-Frames compliance )PPS and SPS headers)
  - bitrate (quantisation?)
  - unnecessary build of mmal components
  - segfault in multiple-files stream generation

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpi-userland/rpi-userland.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 1741153..b17a5f4 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = 0d486513f56453f8203c270fcad0b04f8e4f1fee
+RPI_USERLAND_VERSION = d2c9f912da389c23ed27e81e940be3540f64fc59
 RPI_USERLAND_SITE = http://github.com/raspberrypi/userland/tarball/$(RPI_USERLAND_VERSION)
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE

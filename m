From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 7 Jul 2013 21:38:50 +0200
Subject: [Buildroot] [git commit] package/rpi-userland: bump version
Message-ID: <20130707200244.ED84C9A591@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=14c9ef95a4db03d89f9683812173878807fcb0c1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Misc fixes for audio and raspi-cam.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/rpi-userland/rpi-userland.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 55d7b09..fca0e25 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = 986774edf7c91a8a91d59abadbdb0b34b5a387dc
+RPI_USERLAND_VERSION = 8b271ac
 RPI_USERLAND_SITE = http://github.com/raspberrypi/userland/tarball/$(RPI_USERLAND_VERSION)
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE

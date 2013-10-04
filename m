From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 5 Oct 2013 00:03:29 +0200
Subject: [Buildroot] [git commit] package/rpi-userland: bump version
Message-ID: <20131004220445.46BC79B90E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b8b69b2da9fa8140fa6dde766170a0815c87a9dd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Misc enhancements and fixes for USB, camera, audio, codecs, dispman,
and openMAX.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpi-userland/rpi-userland.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index fca0e25..c3ea43a 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = 8b271ac
+RPI_USERLAND_VERSION = 77d32cd
 RPI_USERLAND_SITE = http://github.com/raspberrypi/userland/tarball/$(RPI_USERLAND_VERSION)
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE

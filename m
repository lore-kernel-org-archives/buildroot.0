From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Jan 2017 22:59:50 +0100
Subject: [Buildroot] [git commit] rpi-userland: bump version
Message-ID: <20170123220845.3C2FA805F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e2f55d41f9c0e86376d84f3829393b418bea039
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpi-userland/rpi-userland.hash | 2 +-
 package/rpi-userland/rpi-userland.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-userland/rpi-userland.hash b/package/rpi-userland/rpi-userland.hash
index 74b1cc9..24b6584 100644
--- a/package/rpi-userland/rpi-userland.hash
+++ b/package/rpi-userland/rpi-userland.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 202f194754ddb28ff3a726477185e90a36b3b98fdbd9889c61cdb0b470166a02 rpi-userland-bb15afe33b313fe045d52277a78653d288e04f67.tar.gz
+sha256 f229c29ceae611101bf4716b112251b2f2a33cfbb6636d736deda4e1314bb9d9 rpi-userland-c139376e9bc6fbd93f777c7fc3c7d7cf2cc35122.tar.gz
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index b3f949c..4e3b4ec 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = bb15afe33b313fe045d52277a78653d288e04f67
+RPI_USERLAND_VERSION = c139376e9bc6fbd93f777c7fc3c7d7cf2cc35122
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE

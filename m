From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jul 2020 17:52:12 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/wpebackend-fdo:
 bump to version 1.6.1
Message-ID: <20200716155439.B26C8876A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cfb5c02b79c564fe013557fd099e8c45da212b10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

This update brings in a few build fixes only. In particular the
one for EGL implementations which use oddball definitions of the
EGLNativeDisplayType type might be needed for some configurations.

Full release notes:

  https://wpewebkit.org/release/wpebackend-fdo-1.6.1.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bbada0c2ecb2ce04d3054cdbfb9efb79c11ee6ed)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpebackend-fdo/wpebackend-fdo.hash | 8 ++++----
 package/wpebackend-fdo/wpebackend-fdo.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpebackend-fdo/wpebackend-fdo.hash b/package/wpebackend-fdo/wpebackend-fdo.hash
index 1380934af3..0b821f3443 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.hash
+++ b/package/wpebackend-fdo/wpebackend-fdo.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpebackend-fdo-1.6.0.tar.xz.sums
-md5  456afeed22f6749f7b2a97c11660835d  wpebackend-fdo-1.6.0.tar.xz
-sha1  d128e2c7ff273d9b9f31217f6ac25be3b266d805  wpebackend-fdo-1.6.0.tar.xz
-sha256  7f5bd7b9d8f97b1655f4dcd39fad92719d0fb3985b251da5802df13aaa09f567  wpebackend-fdo-1.6.0.tar.xz
+# From https://wpewebkit.org/releases/wpebackend-fdo-1.6.1.tar.xz.sums
+md5  ea6c2a13e6c2423f2c2b0b31fcf9567b  wpebackend-fdo-1.6.1.tar.xz
+sha1  53e38189324d9c0c87f40164d8349a827663aabd  wpebackend-fdo-1.6.1.tar.xz
+sha256  740eee3327acfb462b8460519a219e30dc0a870326e88e2ddc4fe2c8de20b1c9  wpebackend-fdo-1.6.1.tar.xz
 
 # Hashes for license files:
 sha256  c9f6803371047fad3e72200ec6cd226329a5ee08ac61104c8211c2761fb46825  COPYING
diff --git a/package/wpebackend-fdo/wpebackend-fdo.mk b/package/wpebackend-fdo/wpebackend-fdo.mk
index 99e10c5a01..5bc2d3ed37 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.mk
+++ b/package/wpebackend-fdo/wpebackend-fdo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEBACKEND_FDO_VERSION = 1.6.0
+WPEBACKEND_FDO_VERSION = 1.6.1
 WPEBACKEND_FDO_SITE = https://wpewebkit.org/releases
 WPEBACKEND_FDO_SOURCE = wpebackend-fdo-$(WPEBACKEND_FDO_VERSION).tar.xz
 WPEBACKEND_FDO_INSTALL_STAGING = YES

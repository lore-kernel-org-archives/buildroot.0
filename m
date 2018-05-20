From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 18:44:24 +0200
Subject: [Buildroot] [git commit branch/next] libphidget: bump to version
 2.1.8.20170607
Message-ID: <20180520164418.7CF8E812E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1417ccecefc94006f7fddac4f761f4f4811bb14e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libphidget/libphidget.hash | 3 ++-
 package/libphidget/libphidget.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libphidget/libphidget.hash b/package/libphidget/libphidget.hash
index a89ba367ed..120d6373e1 100644
--- a/package/libphidget/libphidget.hash
+++ b/package/libphidget/libphidget.hash
@@ -1,2 +1,3 @@
 # locally computed
-sha256  2d496828a085ada8ff139da9306bd2b8cb987798fee93caf0089dc399195e238  libphidget_2.1.8.20140319.tar.gz
+sha256  f6da13dc0db057c1a87e0a831e3f5507cd26a32f3ced40f2c0ad783fc244bcd5  libphidget_2.1.8.20170607.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/libphidget/libphidget.mk b/package/libphidget/libphidget.mk
index 803d5012a4..d84a8b911d 100644
--- a/package/libphidget/libphidget.mk
+++ b/package/libphidget/libphidget.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPHIDGET_VERSION = 2.1.8.20140319
+LIBPHIDGET_VERSION = 2.1.8.20170607
 LIBPHIDGET_SOURCE = libphidget_$(LIBPHIDGET_VERSION).tar.gz
 LIBPHIDGET_SITE = https://www.phidgets.com/downloads/phidget21/libraries/linux/libphidget
 LIBPHIDGET_DEPENDENCIES = libusb

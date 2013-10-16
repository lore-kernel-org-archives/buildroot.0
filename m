From: Phil Eichinger <phil.eichinger@gmail.com>
Date: Wed, 16 Oct 2013 10:39:52 +0200
Subject: [Buildroot] [PATCH 1/1] scons: bump version
Message-ID: <1381912792-30029-1-git-send-email-phil@zankapfel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Phil Eichinger <phil@zankapfel.net>
---
Packages currently depending on SCons (exfat, exfat-utils, gpsd) still 
build fine with the new version.

 package/scons/scons.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index aee0af1..a7747d5 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SCONS_VERSION = 2.2.0
+SCONS_VERSION = 2.3.0
 SCONS_SITE = http://downloads.sourceforge.net/project/scons/scons/$(SCONS_VERSION)
 SCONS_LICENSE = MIT
 SCONS_LICENSE_FILES = LICENSE.txt
-- 
1.7.10.4

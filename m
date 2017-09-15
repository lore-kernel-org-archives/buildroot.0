From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Sep 2017 16:27:49 +0200
Subject: [Buildroot] [PATCH] chrony: bump version to 3.2
Message-ID: <20170915142749.11591-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add a hash for the license file while we're at it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/chrony/chrony.hash | 8 +++++---
 package/chrony/chrony.mk   | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/chrony/chrony.hash b/package/chrony/chrony.hash
index 8501808837..41590356b0 100644
--- a/package/chrony/chrony.hash
+++ b/package/chrony/chrony.hash
@@ -1,3 +1,5 @@
-# From https://listengine.tuxfamily.org/chrony.tuxfamily.org/chrony-announce/2017/01/msg00003.html
-md5 f8d2ee78c55548bfbe95582c6a855cee  chrony-3.1.tar.gz
-sha1 564dd010a10fbdcc7c177337115ccffa43fe0f95  chrony-3.1.tar.gz
+# From https://www.mail-archive.com/chrony-dev at chrony.tuxfamily.org/msg01675.html
+md5 f4c4eb0dc92f35ee4bb7d3dcd8029ecb  chrony-3.2.tar.gz
+sha1 64db6c31e013222cc0a2b66322192b4cedf6e048  chrony-3.2.tar.gz
+# Locally calculated
+sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index 3b10c8cbff..3aed8226f6 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHRONY_VERSION = 3.1
+CHRONY_VERSION = 3.2
 CHRONY_SITE = http://download.tuxfamily.org/chrony
 CHRONY_LICENSE = GPL-2.0
 CHRONY_LICENSE_FILES = COPYING
-- 
2.11.0

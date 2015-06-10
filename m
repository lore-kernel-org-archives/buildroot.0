From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 10 Jun 2015 16:43:15 -0300
Subject: [Buildroot] [PATCH] freetype: bump to version 2.6.0
Message-ID: <1433965395-7378-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/freetype/freetype.hash | 6 +++---
 package/freetype/freetype.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freetype/freetype.hash b/package/freetype/freetype.hash
index f890c7f..16450d0 100644
--- a/package/freetype/freetype.hash
+++ b/package/freetype/freetype.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/freetype/files/freetype2/2.5.5/
-md5	2a7a314927011d5030903179cf183be0	freetype-2.5.5.tar.bz2
-sha1	7b7460ef51a8fdb17baae53c6658fc1ad000a1c2	freetype-2.5.5.tar.bz2
+# From http://sourceforge.net/projects/freetype/files/freetype2/2.6/
+md5	5682890cb0267f6671dd3de6eabd3e69	freetype-2.6.tar.bz2
+sha1	cd2b144205dd2c61693e2d861069367aa3dde1bc	freetype-2.6.tar.bz2
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 56274cb..e3c8240 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREETYPE_VERSION = 2.5.5
+FREETYPE_VERSION = 2.6
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
 FREETYPE_SITE = http://downloads.sourceforge.net/project/freetype/freetype2/$(FREETYPE_VERSION)
 FREETYPE_INSTALL_STAGING = YES
-- 
2.3.6

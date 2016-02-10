From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 10 Feb 2016 07:37:37 -0300
Subject: [Buildroot] [PATCH] freetype: bump to version 2.6.3
Message-ID: <1455100657-895-1-git-send-email-gustavo@zacarias.com.ar>
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
index dc238f2..45f91df 100644
--- a/package/freetype/freetype.hash
+++ b/package/freetype/freetype.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/freetype/files/freetype2/2.6.2/
-md5 86109d0c998787d81ac582bad9adf82e  freetype-2.6.2.tar.bz2
-sha1 29c22b85b77cb22cf95c13e7062e21f39fe6b17a  freetype-2.6.2.tar.bz2
+# From http://sourceforge.net/projects/freetype/files/freetype2/2.6.3/
+md5	0037b25a8c090bc8a1218e867b32beb1	freetype-2.6.3.tar.bz2
+sha1	6c98bd5d0be313207c37ca23d25faf983486aee5	freetype-2.6.3.tar.bz2
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index fa11b0c..d95c424 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREETYPE_VERSION = 2.6.2
+FREETYPE_VERSION = 2.6.3
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
 FREETYPE_SITE = http://downloads.sourceforge.net/project/freetype/freetype2/$(FREETYPE_VERSION)
 FREETYPE_INSTALL_STAGING = YES
-- 
2.4.10

From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 31 Dec 2014 10:40:43 -0300
Subject: [Buildroot] [PATCH] freetype: bump to version 2.5.5
Message-ID: <1420033243-13190-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2.5.4 introduced a regression with uncompressed PCF files.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/freetype/freetype.hash | 5 +++--
 package/freetype/freetype.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/freetype/freetype.hash b/package/freetype/freetype.hash
index 8184eb0..f890c7f 100644
--- a/package/freetype/freetype.hash
+++ b/package/freetype/freetype.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256  3b4e2c666b33b32ad29ff0fe5c6538e757d3c73368e5dfa88bd59b4bc95cbabb  freetype-2.5.4.tar.bz2
+# From http://sourceforge.net/projects/freetype/files/freetype2/2.5.5/
+md5	2a7a314927011d5030903179cf183be0	freetype-2.5.5.tar.bz2
+sha1	7b7460ef51a8fdb17baae53c6658fc1ad000a1c2	freetype-2.5.5.tar.bz2
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index c2f7f13..0de5ce3 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREETYPE_VERSION = 2.5.4
+FREETYPE_VERSION = 2.5.5
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
 FREETYPE_SITE = http://downloads.sourceforge.net/project/freetype/freetype2/$(FREETYPE_VERSION)
 FREETYPE_INSTALL_STAGING = YES
-- 
2.0.5

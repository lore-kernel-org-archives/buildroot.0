From: Axel Lin <axel.lin@ingics.com>
Date: Thu, 12 Dec 2013 21:18:04 +0800
Subject: [Buildroot] [PATCH] file: bump to version 5.16
Message-ID: <1386854284.14822.0.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/file/file.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/file/file.mk b/package/file/file.mk
index 6436802..dc7c206 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FILE_VERSION = 5.15
+FILE_VERSION = 5.16
 FILE_SITE = ftp://ftp.astron.com/pub/file
 FILE_DEPENDENCIES = host-file zlib
 FILE_INSTALL_STAGING = YES
-- 
1.8.1.2

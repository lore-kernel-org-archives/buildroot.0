From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Feb 2014 10:48:03 -0300
Subject: [Buildroot] [PATCH] file: bump to version 5.17
Message-ID: <1393595283-24703-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/file/file.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/file/file.mk b/package/file/file.mk
index dc7c206..ac9cf55 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FILE_VERSION = 5.16
+FILE_VERSION = 5.17
 FILE_SITE = ftp://ftp.astron.com/pub/file
 FILE_DEPENDENCIES = host-file zlib
 FILE_INSTALL_STAGING = YES
-- 
1.8.3.2

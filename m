From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  1 Mar 2013 07:23:27 -0300
Subject: [Buildroot] [PATCH 7/7] file: bump to version 5.13
In-Reply-To: <1362133407-5840-1-git-send-email-gustavo@zacarias.com.ar>
References: <1362133407-5840-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1362133407-5840-7-git-send-email-gustavo@zacarias.com.ar>
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
index db68f66..7206705 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-FILE_VERSION = 5.11
+FILE_VERSION = 5.13
 FILE_SITE = ftp://ftp.astron.com/pub/file
 FILE_DEPENDENCIES = host-file zlib
 FILE_INSTALL_STAGING = YES
-- 
1.7.12.4

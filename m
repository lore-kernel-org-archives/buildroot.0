From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  3 Apr 2014 21:00:59 +0200
Subject: [Buildroot] [PATCH v4 04/37] file: Version bump 5.18
In-Reply-To: <1396551692-12371-1-git-send-email-bernd.kuhls@t-online.de>
References: <1396551692-12371-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1396551692-12371-5-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/file/file.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/file/file.mk b/package/file/file.mk
index ac9cf55..846d56a 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FILE_VERSION = 5.17
+FILE_VERSION = 5.18
 FILE_SITE = ftp://ftp.astron.com/pub/file
 FILE_DEPENDENCIES = host-file zlib
 FILE_INSTALL_STAGING = YES
-- 
1.7.10.4

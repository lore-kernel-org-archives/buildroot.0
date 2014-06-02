From: =?UTF-8?q?Arnaud=20R=C3=A9billout?= <rebillout@syscom.ch>
Date: Mon,  2 Jun 2014 15:41:30 +0200
Subject: [Buildroot] [PATCH] lftp: bump to last version 4.4.16
Message-ID: <1401716490-19572-1-git-send-email-rebillout@syscom.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnaud R?billout <rebillout@syscom.ch>
---
 package/lftp/lftp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
index 5c6fd4b..244ebde 100644
--- a/package/lftp/lftp.mk
+++ b/package/lftp/lftp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LFTP_VERSION = 4.4.15
+LFTP_VERSION = 4.4.16
 LFTP_SITE    = http://lftp.yar.ru/ftp
 LFTP_LICENSE = GPLv3+
 LFTP_LICENSE_FILES = COPYING
-- 
2.0.0.rc0

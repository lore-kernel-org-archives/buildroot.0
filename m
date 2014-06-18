From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 18 Jun 2014 13:22:31 -0300
Subject: [Buildroot] [PATCH] lftp: bump to version 4.5.2
Message-ID: <1403108551-15514-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/lftp/lftp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
index 244ebde..431fadb 100644
--- a/package/lftp/lftp.mk
+++ b/package/lftp/lftp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LFTP_VERSION = 4.4.16
+LFTP_VERSION = 4.5.2
 LFTP_SITE    = http://lftp.yar.ru/ftp
 LFTP_LICENSE = GPLv3+
 LFTP_LICENSE_FILES = COPYING
-- 
1.8.5.5

From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  2 May 2013 11:26:17 -0300
Subject: [Buildroot] [PATCH] samba: bump to version 3.6.14
Message-ID: <1367504777-27146-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/samba/samba.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index 7f9b918..3a004e1 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SAMBA_VERSION = 3.6.13
+SAMBA_VERSION = 3.6.14
 SAMBA_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA_SUBDIR = source3
 SAMBA_INSTALL_STAGING = YES
-- 
1.8.1.5

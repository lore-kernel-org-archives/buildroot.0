From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 11 Nov 2013 19:37:51 -0300
Subject: [Buildroot] [PATCH] samba: security bump to version 3.6.20
Message-ID: <1384209471-18533-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2013-4475 and CVE-2013-4476.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/samba/samba.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index fca2f24..cbeacc4 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA_VERSION = 3.6.19
+SAMBA_VERSION = 3.6.20
 SAMBA_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA_SUBDIR = source3
 SAMBA_INSTALL_STAGING = YES
-- 
1.8.3.2

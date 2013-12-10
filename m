From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 10 Dec 2013 09:02:55 -0300
Subject: [Buildroot] [PATCH] samba: security bump to version 3.6.22
Message-ID: <1386676975-6949-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2013-4408 and CVE-2012-6150.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/samba/samba.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index eb43124..1508a24 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA_VERSION = 3.6.21
+SAMBA_VERSION = 3.6.22
 SAMBA_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA_SUBDIR = source3
 SAMBA_INSTALL_STAGING = YES
-- 
1.8.3.2

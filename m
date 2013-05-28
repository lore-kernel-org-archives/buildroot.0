From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 May 2013 09:17:30 -0300
Subject: [Buildroot] [PATCH 1/3] gmp: bump to version 5.1.2
Message-ID: <1369743452-12867-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gmp/gmp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index e895a48..cf5c310 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-GMP_VERSION = 5.1.1
+GMP_VERSION = 5.1.2
 GMP_SITE = ftp://ftp.gmplib.org/pub/gmp-$(GMP_VERSION)
 GMP_SOURCE = gmp-$(GMP_VERSION).tar.bz2
 GMP_INSTALL_STAGING = YES
-- 
1.8.1.5

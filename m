From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  9 Jun 2014 14:03:49 -0300
Subject: [Buildroot] [PATCH] libcgicc: bump to version 3.2.15
Message-ID: <1402333429-22089-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libcgicc/libcgicc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcgicc/libcgicc.mk b/package/libcgicc/libcgicc.mk
index 945c435..d146dab 100644
--- a/package/libcgicc/libcgicc.mk
+++ b/package/libcgicc/libcgicc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCGICC_VERSION = 3.2.14
+LIBCGICC_VERSION = 3.2.15
 LIBCGICC_SITE = $(BR2_GNU_MIRROR)/cgicc
 LIBCGICC_SOURCE = cgicc-$(LIBCGICC_VERSION).tar.gz
 LIBCGICC_LICENSE = LGPLv3+ (library), GFDL1.2+ (docs)
-- 
1.8.5.5

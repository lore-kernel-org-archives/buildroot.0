From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  1 Jan 2014 10:58:47 -0300
Subject: [Buildroot] [PATCH] libcgicc: bump to version 3.2.12
Message-ID: <1388584727-14862-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...tion-option.patch => libcgicc-01-disable-documentation-option.patch} | 0
 package/libcgicc/libcgicc.mk                                            | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename package/libcgicc/{libcgicc-3.2.9-disable-documentation-option.patch => libcgicc-01-disable-documentation-option.patch} (100%)

diff --git a/package/libcgicc/libcgicc-3.2.9-disable-documentation-option.patch b/package/libcgicc/libcgicc-01-disable-documentation-option.patch
similarity index 100%
rename from package/libcgicc/libcgicc-3.2.9-disable-documentation-option.patch
rename to package/libcgicc/libcgicc-01-disable-documentation-option.patch
diff --git a/package/libcgicc/libcgicc.mk b/package/libcgicc/libcgicc.mk
index a3c64d2..f1c181f 100644
--- a/package/libcgicc/libcgicc.mk
+++ b/package/libcgicc/libcgicc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCGICC_VERSION = 3.2.9
+LIBCGICC_VERSION = 3.2.12
 LIBCGICC_SITE = $(BR2_GNU_MIRROR)/cgicc
 LIBCGICC_SOURCE = cgicc-$(LIBCGICC_VERSION).tar.gz
 LIBCGICC_LICENSE = LGPLv3+
-- 
1.8.3.2

From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  3 Apr 2014 11:14:56 -0300
Subject: [Buildroot] [PATCH] gmp: bump to version 6.0.0a
Message-ID: <1396534496-20980-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gmp/gmp.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index d970545..f71a210 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-GMP_VERSION = 5.1.3
+GMP_VERSION = 6.0.0a
 GMP_SITE = $(BR2_GNU_MIRROR)/gmp
 GMP_SOURCE = gmp-$(GMP_VERSION).tar.xz
 GMP_INSTALL_STAGING = YES
 GMP_LICENSE = LGPLv3+
-GMP_LICENSE_FILES = COPYING.LIB
+GMP_LICENSE_FILES = COPYING.LESSERv3
 GMP_DEPENDENCIES = host-m4
 
 $(eval $(autotools-package))
-- 
1.8.3.2

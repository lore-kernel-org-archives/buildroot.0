From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  2 Oct 2013 09:28:46 -0300
Subject: [Buildroot] [PATCH 3/3] gmp: bump to version 5.1.3
In-Reply-To: <1380716926-24611-1-git-send-email-gustavo@zacarias.com.ar>
References: <1380716926-24611-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1380716926-24611-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also switch to http gnu site instead of ftp.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gmp/gmp.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index 86ed33c..d970545 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GMP_VERSION = 5.1.2
-GMP_SITE = ftp://ftp.gmplib.org/pub/gmp-$(GMP_VERSION)
+GMP_VERSION = 5.1.3
+GMP_SITE = $(BR2_GNU_MIRROR)/gmp
 GMP_SOURCE = gmp-$(GMP_VERSION).tar.xz
 GMP_INSTALL_STAGING = YES
 GMP_LICENSE = LGPLv3+
-- 
1.8.1.5

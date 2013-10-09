From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Oct 2013 16:49:34 -0300
Subject: [Buildroot] [PATCH 2/5] libgpg-error: bump to version 1.12
In-Reply-To: <1381348177-2189-1-git-send-email-gustavo@zacarias.com.ar>
References: <1381348177-2189-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1381348177-2189-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libgpg-error/libgpg-error.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 04874a7..9f5f6c2 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPG_ERROR_VERSION = 1.10
+LIBGPG_ERROR_VERSION = 1.12
 LIBGPG_ERROR_SITE = ftp://ftp.gnupg.org/gcrypt/libgpg-error
 LIBGPG_ERROR_LICENSE = LGPLv2.1+
 LIBGPG_ERROR_LICENSE_FILES = COPYING.LIB
-- 
1.8.1.5

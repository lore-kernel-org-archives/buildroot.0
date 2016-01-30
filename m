From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 Jan 2016 16:43:01 +0100
Subject: [Buildroot] [PATCH 1/1] package/liboauth: fix broken download URL
Message-ID: <1454168581-13878-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/liboauth/liboauth.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/liboauth/liboauth.mk b/package/liboauth/liboauth.mk
index 3b482bf..bd54330 100644
--- a/package/liboauth/liboauth.mk
+++ b/package/liboauth/liboauth.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBOAUTH_VERSION = 1.0.3
-LIBOAUTH_SITE = http://liboauth.sourceforge.net/pool
+LIBOAUTH_SITE = http://downloads.sourceforge.net/project/liboauth
 LIBOAUTH_INSTALL_STAGING = YES
 LIBOAUTH_DEPENDENCIES += host-pkgconf openssl
 LIBOAUTH_LICENSE = MIT
-- 
2.7.0.rc3

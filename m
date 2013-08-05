From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  5 Aug 2013 13:21:12 -0300
Subject: [Buildroot] [PATCH 2/3] libgcrypt: security bump to version 1.5.3
In-Reply-To: <1375719673-548-1-git-send-email-gustavo@zacarias.com.ar>
References: <1375719673-548-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1375719673-548-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2013-4242.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libgcrypt/libgcrypt.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index f8c0860..82a824f 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGCRYPT_VERSION = 1.5.2
+LIBGCRYPT_VERSION = 1.5.3
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPLv2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
-- 
1.8.1.5

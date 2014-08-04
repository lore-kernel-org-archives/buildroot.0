From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  4 Aug 2014 14:48:00 -0300
Subject: [Buildroot] [PATCH 1/3] libgpgme: security bump to version 1.5.1
Message-ID: <1407174482-16108-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2014-3564 - heap-based buffer overflow in gpgsm status handler.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libgpgme/libgpgme.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index ae9660f..ce8a61a 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPGME_VERSION = 1.5.0
+LIBGPGME_VERSION = 1.5.1
 LIBGPGME_SITE = ftp://ftp.gnupg.org/gcrypt/gpgme
 LIBGPGME_SOURCE = gpgme-$(LIBGPGME_VERSION).tar.bz2
 LIBGPGME_LICENSE = LGPLv2.1+
-- 
1.8.5.5

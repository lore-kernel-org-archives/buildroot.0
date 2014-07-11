From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 Jul 2014 16:36:24 -0300
Subject: [Buildroot] [PATCH 2/2] libgpgme: bump to version 1.5.0
In-Reply-To: <1405107384-9820-1-git-send-email-gustavo@zacarias.com.ar>
References: <1405107384-9820-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1405107384-9820-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libgpgme/libgpgme.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index 9995d91..c06d713 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPGME_VERSION = 1.4.2
+LIBGPGME_VERSION = 1.5.0
 LIBGPGME_SITE = ftp://ftp.gnupg.org/gcrypt/gpgme/
 LIBGPGME_SOURCE = gpgme-$(LIBGPGME_VERSION).tar.bz2
 LIBGPGME_LICENSE = LGPLv2.1+
-- 
1.8.5.5

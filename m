From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 13 Apr 2015 18:18:16 -0300
Subject: [Buildroot] [PATCH] libgpgme: bump to version 1.5.4
Message-ID: <1428959896-32284-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libgpgme/libgpgme.hash | 4 ++--
 package/libgpgme/libgpgme.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgpgme/libgpgme.hash b/package/libgpgme/libgpgme.hash
index 7ed9b48..a6d2d44 100644
--- a/package/libgpgme/libgpgme.hash
+++ b/package/libgpgme/libgpgme.hash
@@ -1,2 +1,2 @@
-# From https://www.gnupg.org/download/integrity_check.html
-sha1  8dd7711a4de117994fe2d45879ef8a9900d50f6a  gpgme-1.5.3.tar.bz2
+# Locally calculated after checking pgp signature
+sha256	bb38c0ec8815c9e94e6047b484984808a8dad9d6bec8df33dc5339fd55ffea6c	gpgme-1.5.4.tar.bz2
diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index 6377b76..79b44bd 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPGME_VERSION = 1.5.3
+LIBGPGME_VERSION = 1.5.4
 LIBGPGME_SITE = ftp://ftp.gnupg.org/gcrypt/gpgme
 LIBGPGME_SOURCE = gpgme-$(LIBGPGME_VERSION).tar.bz2
 LIBGPGME_LICENSE = LGPLv2.1+
-- 
2.0.5

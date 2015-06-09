From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  9 Jun 2015 14:24:53 -0300
Subject: [Buildroot] [PATCH] libgpgme: bump to version 1.5.5
Message-ID: <1433870693-8561-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libgpgme/libgpgme.hash | 2 +-
 package/libgpgme/libgpgme.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgpgme/libgpgme.hash b/package/libgpgme/libgpgme.hash
index a6d2d44..a7efbf6 100644
--- a/package/libgpgme/libgpgme.hash
+++ b/package/libgpgme/libgpgme.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	bb38c0ec8815c9e94e6047b484984808a8dad9d6bec8df33dc5339fd55ffea6c	gpgme-1.5.4.tar.bz2
+sha256	0b3d3d5107680c594777aae65882a1ff6dd1ba629a83432e719c8b82a743c207	gpgme-1.5.5.tar.bz2
diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index 79b44bd..ec64d37 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPGME_VERSION = 1.5.4
+LIBGPGME_VERSION = 1.5.5
 LIBGPGME_SITE = ftp://ftp.gnupg.org/gcrypt/gpgme
 LIBGPGME_SOURCE = gpgme-$(LIBGPGME_VERSION).tar.bz2
 LIBGPGME_LICENSE = LGPLv2.1+
-- 
2.3.6

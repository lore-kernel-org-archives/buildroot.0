From: Baruch Siach <baruch@tkos.co.il>
Date: Fri,  5 Jul 2019 07:32:12 +0300
Subject: [Buildroot] [PATCH 1/3] package/libgpgme: bump to version 1.13.1
Message-ID: <42ce7221ac70a831016205e8111c2cb313403054.1562301134.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libgpgme/libgpgme.hash | 6 ++----
 package/libgpgme/libgpgme.mk   | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/libgpgme/libgpgme.hash b/package/libgpgme/libgpgme.hash
index 1e61fbd833b2..6ed6a3625da2 100644
--- a/package/libgpgme/libgpgme.hash
+++ b/package/libgpgme/libgpgme.hash
@@ -1,8 +1,6 @@
-# From https://lists.gnupg.org/pipermail/gnupg-announce/2018q4/000429.html
-sha1 6f1828fcd7de4366ca063e57f35e4ab24bc91baf  gpgme-1.12.0.tar.bz2
 # Locally calculated after checking pgp signature
-# https://gnupg.org/ftp/gcrypt/gpgme/gpgme-1.12.0.tar.bz2.sig
+# https://gnupg.org/ftp/gcrypt/gpgme/gpgme-1.13.1.tar.bz2.sig
 # using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
-sha256 b4dc951c3743a60e2e120a77892e9e864fb936b2e58e7c77e8581f4d050e8cd8  gpgme-1.12.0.tar.bz2
+sha256 c4e30b227682374c23cddc7fdb9324a99694d907e79242a25a4deeedb393be46  gpgme-1.13.1.tar.bz2
 # Locally calculated
 sha256 ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING.LESSER
diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index 85450c83d2df..f916ca180cfb 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPGME_VERSION = 1.12.0
+LIBGPGME_VERSION = 1.13.1
 LIBGPGME_SITE = https://gnupg.org/ftp/gcrypt/gpgme
 LIBGPGME_SOURCE = gpgme-$(LIBGPGME_VERSION).tar.bz2
 LIBGPGME_LICENSE = LGPL-2.1+
-- 
2.20.1

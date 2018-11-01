From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Nov 2018 13:53:43 +0100
Subject: [Buildroot] [git commit] libgpgme: bump to version 1.12.0
Message-ID: <20181101131712.1626883CAB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=858fa64203a6bc9896075198ef25dfa97ab06ec9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libgpgme/libgpgme.hash | 9 +++++----
 package/libgpgme/libgpgme.mk   | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/libgpgme/libgpgme.hash b/package/libgpgme/libgpgme.hash
index 54c7bf7a09..1e61fbd833 100644
--- a/package/libgpgme/libgpgme.hash
+++ b/package/libgpgme/libgpgme.hash
@@ -1,7 +1,8 @@
-# From https://lists.gnupg.org/pipermail/gnupg-announce/2018q2/000423.html
-sha1 95b1fc427871ca8d30d6d3b1985c816fe0b5077b  gpgme-1.11.1.tar.bz2
+# From https://lists.gnupg.org/pipermail/gnupg-announce/2018q4/000429.html
+sha1 6f1828fcd7de4366ca063e57f35e4ab24bc91baf  gpgme-1.12.0.tar.bz2
 # Locally calculated after checking pgp signature
-# https://gnupg.org/ftp/gcrypt/gpgme/gpgme-1.11.1.tar.bz2.sig
-sha256 2d1b111774d2e3dd26dcd7c251819ce4ef774ec5e566251eb9308fa7542fbd6f  gpgme-1.11.1.tar.bz2
+# https://gnupg.org/ftp/gcrypt/gpgme/gpgme-1.12.0.tar.bz2.sig
+# using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
+sha256 b4dc951c3743a60e2e120a77892e9e864fb936b2e58e7c77e8581f4d050e8cd8  gpgme-1.12.0.tar.bz2
 # Locally calculated
 sha256 ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING.LESSER
diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index 03402cf382..a70ffcf11d 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPGME_VERSION = 1.11.1
+LIBGPGME_VERSION = 1.12.0
 LIBGPGME_SITE = https://gnupg.org/ftp/gcrypt/gpgme
 LIBGPGME_SOURCE = gpgme-$(LIBGPGME_VERSION).tar.bz2
 LIBGPGME_LICENSE = LGPL-2.1+

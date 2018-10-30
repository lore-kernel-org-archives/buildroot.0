From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 30 Oct 2018 13:40:21 +0200
Subject: [Buildroot] [PATCH 3/6] libgpgme: bump to version 1.12.0
In-Reply-To: <df3569102a6ce73ffbde85da1e4ccc7d877ee1b6.1540899624.git.baruch@tkos.co.il>
References: <df3569102a6ce73ffbde85da1e4ccc7d877ee1b6.1540899624.git.baruch@tkos.co.il>
Message-ID: <ce4b3ce4d968205ccfe1795da7ea703015d1efd7.1540899624.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libgpgme/libgpgme.hash | 9 +++++----
 package/libgpgme/libgpgme.mk   | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/libgpgme/libgpgme.hash b/package/libgpgme/libgpgme.hash
index 54c7bf7a0984..1e61fbd833b2 100644
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
index 03402cf38286..a70ffcf11d2f 100644
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
-- 
2.19.1

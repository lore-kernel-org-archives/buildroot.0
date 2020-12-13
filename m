From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Dec 2020 22:10:13 +0100
Subject: [Buildroot] [git commit] package/libgpg-error: bump to version 1.39
Message-ID: <20201213205600.8B4B584298@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e4652c36c94f5aafdca39206764da2750a8660e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://dev.gnupg.org/T5031
https://dev.gnupg.org/T4859

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libgpg-error/libgpg-error.hash | 7 +++++--
 package/libgpg-error/libgpg-error.mk   | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/libgpg-error/libgpg-error.hash b/package/libgpg-error/libgpg-error.hash
index 05c46d6d43..70aa3a01d8 100644
--- a/package/libgpg-error/libgpg-error.hash
+++ b/package/libgpg-error/libgpg-error.hash
@@ -1,7 +1,10 @@
+# From https://www.gnupg.org/download/integrity_check.html
+sha1  991a7a53e778a3de5ba8aad711e0bc9453101f4b  libgpg-error-1.39.tar.bz2
+
 # Locally calculated after checking pgp signature
-# https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.37.tar.bz2.sig
+# https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.39.tar.bz2.sig
 # using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
-sha256  b32d6ff72a73cf79797f7f2d039e95e9c6f92f0c1450215410840ab62aea9763  libgpg-error-1.37.tar.bz2
+sha256  4a836edcae592094ef1c5a4834908f44986ab2b82e0824a0344b49df8cdb298f  libgpg-error-1.39.tar.bz2
 # Locally calculated
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 6281faa662..8980c67012 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPG_ERROR_VERSION = 1.37
+LIBGPG_ERROR_VERSION = 1.39
 LIBGPG_ERROR_SITE = https://www.gnupg.org/ftp/gcrypt/libgpg-error
 LIBGPG_ERROR_SOURCE = libgpg-error-$(LIBGPG_ERROR_VERSION).tar.bz2
 LIBGPG_ERROR_LICENSE = GPL-2.0+, LGPL-2.1+

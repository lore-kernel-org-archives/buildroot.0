From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 19:51:23 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] libgpg-error: bump to
 version 1.32
Message-ID: <20190124190126.2F9D681596@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e8a43fb2ed8e3e6dccc053272102c073064ea5aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 00f879faf5169f5b78f8ee2d267f7add639eb8ba)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgpg-error/libgpg-error.hash | 5 +++--
 package/libgpg-error/libgpg-error.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libgpg-error/libgpg-error.hash b/package/libgpg-error/libgpg-error.hash
index 608f9c62d7..93593b1411 100644
--- a/package/libgpg-error/libgpg-error.hash
+++ b/package/libgpg-error/libgpg-error.hash
@@ -1,6 +1,7 @@
 # Locally calculated after checking pgp signature
-# https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.31.tar.bz2.sig
-sha256 40d0a823c9329478063903192a1f82496083b277265904878f4bc09e0db7a4ef  libgpg-error-1.31.tar.bz2
+# https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.32.tar.bz2.sig
+# using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
+sha256 c345c5e73cc2332f8d50db84a2280abfb1d8f6d4f1858b9daa30404db44540ca  libgpg-error-1.32.tar.bz2
 # Locally calculated
 sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256 a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index aed5a517b0..ef817c7cc6 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPG_ERROR_VERSION = 1.31
+LIBGPG_ERROR_VERSION = 1.32
 LIBGPG_ERROR_SITE = https://www.gnupg.org/ftp/gcrypt/libgpg-error
 LIBGPG_ERROR_SOURCE = libgpg-error-$(LIBGPG_ERROR_VERSION).tar.bz2
 LIBGPG_ERROR_LICENSE = GPL-2.0+, LGPL-2.1+

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Jul 2021 23:12:18 +0200
Subject: [Buildroot] [git commit] package/libassuan: bump to version 2.5.5
Message-ID: <20210703204040.2B3D3874C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=56b886848987a310eb4c859f3295f3c815dd5e54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://dev.gnupg.org/T5354

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libassuan/libassuan.hash | 6 +++---
 package/libassuan/libassuan.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libassuan/libassuan.hash b/package/libassuan/libassuan.hash
index 3506b4f858..c817a3af63 100644
--- a/package/libassuan/libassuan.hash
+++ b/package/libassuan/libassuan.hash
@@ -1,8 +1,8 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  55a35918e95566ef94e8843879a7dd3f87de3781  libassuan-2.5.4.tar.bz2
+sha1  ec4f67c0117ccd17007c748a392ded96dc1b1ae9  libassuan-2.5.5.tar.bz2
 # Locally calculated after checking signature
-# https://www.gnupg.org/ftp/gcrypt/libassuan/libassuan-2.5.4.tar.bz2.sig
+# https://www.gnupg.org/ftp/gcrypt/libassuan/libassuan-2.5.5.tar.bz2.sig
 # using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
-sha256  c080ee96b3bd519edd696cfcebdecf19a3952189178db9887be713ccbcb5fbf0  libassuan-2.5.4.tar.bz2
+sha256  8e8c2fcc982f9ca67dcbb1d95e2dc746b1739a4668bc20b3a3c5be632edb34e4  libassuan-2.5.5.tar.bz2
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/libassuan/libassuan.mk b/package/libassuan/libassuan.mk
index 8b618197f9..f98c13b59f 100644
--- a/package/libassuan/libassuan.mk
+++ b/package/libassuan/libassuan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBASSUAN_VERSION = 2.5.4
+LIBASSUAN_VERSION = 2.5.5
 LIBASSUAN_SITE = ftp://ftp.gnupg.org/gcrypt/libassuan
 LIBASSUAN_SOURCE = libassuan-$(LIBASSUAN_VERSION).tar.bz2
 LIBASSUAN_LICENSE = LGPL-2.1+ (library), GPL-3.0 (tests, doc)

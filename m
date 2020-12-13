From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Dec 2020 14:49:43 +0100
Subject: [Buildroot] [git commit] package/libassuan: bump to version 2.5.4
Message-ID: <20201213133350.465B8813B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1cf646780a13b53cca9aa2c379560875582ff688
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file

https://dev.gnupg.org/T5112

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libassuan/libassuan.hash | 10 +++++-----
 package/libassuan/libassuan.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libassuan/libassuan.hash b/package/libassuan/libassuan.hash
index bb008d6ed4..3506b4f858 100644
--- a/package/libassuan/libassuan.hash
+++ b/package/libassuan/libassuan.hash
@@ -1,8 +1,8 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1 6d81bf42fa91ed2894df8b65764ce899e39776f8  libassuan-2.5.3.tar.bz2
+sha1  55a35918e95566ef94e8843879a7dd3f87de3781  libassuan-2.5.4.tar.bz2
 # Locally calculated after checking signature
-# https://www.gnupg.org/ftp/gcrypt/libassuan/libassuan-2.5.3.tar.bz2.sig
+# https://www.gnupg.org/ftp/gcrypt/libassuan/libassuan-2.5.4.tar.bz2.sig
 # using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
-sha256 91bcb0403866b4e7c4bc1cc52ed4c364a9b5414b3994f718c70303f7f765e702  libassuan-2.5.3.tar.bz2
-sha256 a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
-sha256 fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
+sha256  c080ee96b3bd519edd696cfcebdecf19a3952189178db9887be713ccbcb5fbf0  libassuan-2.5.4.tar.bz2
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
+sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/libassuan/libassuan.mk b/package/libassuan/libassuan.mk
index 034a9bfdfe..8b618197f9 100644
--- a/package/libassuan/libassuan.mk
+++ b/package/libassuan/libassuan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBASSUAN_VERSION = 2.5.3
+LIBASSUAN_VERSION = 2.5.4
 LIBASSUAN_SITE = ftp://ftp.gnupg.org/gcrypt/libassuan
 LIBASSUAN_SOURCE = libassuan-$(LIBASSUAN_VERSION).tar.bz2
 LIBASSUAN_LICENSE = LGPL-2.1+ (library), GPL-3.0 (tests, doc)

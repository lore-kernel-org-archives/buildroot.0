From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Dec 2020 14:49:44 +0100
Subject: [Buildroot] [git commit] package/libgcrypt: bump to version 1.8.7
Message-ID: <20201213133350.59C72813B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2109c5862a1b57e43e8bdc4bec2f01e26fe3baa2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://dev.gnupg.org/T5113

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libgcrypt/libgcrypt.hash | 8 ++++----
 package/libgcrypt/libgcrypt.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
index c8aae17c18..fd9169ca8b 100644
--- a/package/libgcrypt/libgcrypt.hash
+++ b/package/libgcrypt/libgcrypt.hash
@@ -1,7 +1,7 @@
-# From https://lists.gnupg.org/pipermail/gnupg-announce/2020q3/000445.html
-sha1  406b02873833427898d16bcc8483bc5c91c73d4a  libgcrypt-1.8.6.tar.bz2
+# From https://www.gnupg.org/download/integrity_check.html
+sha1  ea79a279b27bf25cb1564f96693128f8fc9f41d6  libgcrypt-1.8.7.tar.bz2
 # Locally calculated after checking signature
-# https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.8.6.tar.bz2.sig
+# https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.8.7.tar.bz2.sig
 # using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
-sha256  0cba2700617b99fc33864a0c16b1fa7fdf9781d9ed3509f5d767178e5fd7b975  libgcrypt-1.8.6.tar.bz2
+sha256  03b70f028299561b7034b8966d7dd77ef16ed139c43440925fe8782561974748  libgcrypt-1.8.7.tar.bz2
 sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING.LIB
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index b2c1ea3cbe..6062fbc851 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGCRYPT_VERSION = 1.8.6
+LIBGCRYPT_VERSION = 1.8.7
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPL-2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB

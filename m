From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Mar 2021 20:39:33 +0100
Subject: [Buildroot] [git commit branch/2021.02.x] package/libgcrypt: bump
 to version 1.9.2
Message-ID: <20210317191607.0EE3E8820D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b464ef599206f7553f916416731027ef7aad56e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

https://lists.gnupg.org/pipermail/gnupg-announce/2021q1/000457.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3d679cd0b1283c52dfbc03872eada6564a26f01c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgcrypt/libgcrypt.hash | 6 +++---
 package/libgcrypt/libgcrypt.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
index c9a8bac9cb..978ec8b294 100644
--- a/package/libgcrypt/libgcrypt.hash
+++ b/package/libgcrypt/libgcrypt.hash
@@ -1,7 +1,7 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  a15ce7355b028f28a33428eaa0147154861b29d4  libgcrypt-1.9.1.tar.bz2
+sha1  29bd5d0a8f674d4521167dd518ef99b26d1e8f27  libgcrypt-1.9.2.tar.bz2
 # Locally calculated after checking signature
-# https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.9.1.tar.bz2.sig
+# https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.9.2.tar.bz2.sig
 # using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
-sha256  c5a67a8b9b2bd370fb415ed1ee31c7172e5683076493cf4a3678a0fbdf0265d9  libgcrypt-1.9.1.tar.bz2
+sha256  b2c10d091513b271e47177274607b1ffba3d95b188bbfa8797f948aec9053c5a  libgcrypt-1.9.2.tar.bz2
 sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING.LIB
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 7c105058a3..9c1cd32acb 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGCRYPT_VERSION = 1.9.1
+LIBGCRYPT_VERSION = 1.9.2
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPL-2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB

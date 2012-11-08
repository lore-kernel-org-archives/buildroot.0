From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 8 Nov 2012 22:36:09 +0100
Subject: [Buildroot] [git commit] libgcrypt: add license information
Message-ID: <20121108213748.A729A99C34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ce70d058f55096a16352d4428f6833c953cd9b7c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mark Jackson <mpfj@newflow.co.uk>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libgcrypt/libgcrypt.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index db5781b..a320e48 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -6,6 +6,8 @@
 
 LIBGCRYPT_VERSION = 1.5.0
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
+LIBGCRYPT_LICENSE = LGPLv2.1+
+LIBGCRYPT_LICENSE_FILES = COPYING.LIB
 LIBGCRYPT_SITE = ftp://ftp.gnupg.org/gcrypt/libgcrypt
 LIBGCRYPT_INSTALL_STAGING = YES
 

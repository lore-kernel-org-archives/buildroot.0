From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 12 Jul 2011 22:29:01 +0200
Subject: [Buildroot] [git commit] libgcrypt: bump version to 1.5.0
Message-ID: <20110712202944.2E0418A486@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=50b62197858f4171372341a97fdc33b28064cce6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Daniel Mack <zonque@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libgcrypt/libgcrypt.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index a7163ea..8b08c3e 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBGCRYPT_VERSION = 1.4.6
+LIBGCRYPT_VERSION = 1.5.0
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_SITE = ftp://ftp.gnupg.org/gcrypt/libgcrypt
 LIBGCRYPT_INSTALL_STAGING = YES
-- 
1.7.3.4

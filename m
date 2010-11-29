From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 29 Nov 2010 21:15:53 +0100
Subject: [Buildroot] [git commit master 1/1] libgcrypt: bump to version
	1.4.6 to fix MIPS build issues
Message-ID: <20101129201620.DCBEF8D34B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=10af218da8c8b00164dd92db12f862f7846a8ea9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                        |    2 +-
 package/libgcrypt/libgcrypt.mk |    8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/CHANGES b/CHANGES
index f696164..bbf5048 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,7 +2,7 @@
 
 	Fixes all over the tree.
 
-	Updated/fixed packages: qt, tcpdump, xserver-xorg
+	Updated/fixed packages: libgcrypt, qt, tcpdump, xserver-xorg
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 646ad83..a7163ea 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -3,11 +3,11 @@
 # libgcrypt
 #
 #############################################################
-LIBGCRYPT_VERSION:=1.4.5
-LIBGCRYPT_SOURCE:=libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
-LIBGCRYPT_SITE:=ftp://ftp.gnupg.org/gcrypt/libgcrypt
+
+LIBGCRYPT_VERSION = 1.4.6
+LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
+LIBGCRYPT_SITE = ftp://ftp.gnupg.org/gcrypt/libgcrypt
 LIBGCRYPT_INSTALL_STAGING = YES
-LIBGCRYPT_INSTALL_TARGET = YES
 
 LIBGCRYPT_CONF_ENV = \
 	ac_cv_sys_symbol_underscore=no
-- 
1.7.2.2

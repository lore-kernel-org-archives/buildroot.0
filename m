From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jun 2020 18:29:08 +0200
Subject: [Buildroot] [git commit] package/libzip: bump to version 1.7.1
Message-ID: <20200614162803.D13D280137@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=92b6d0919819111a43aa826ddf40a553e73e3f55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See https://github.com/nih-at/libzip/releases

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libzip/libzip.hash | 2 +-
 package/libzip/libzip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libzip/libzip.hash b/package/libzip/libzip.hash
index af4c9db509..1ca4828f09 100644
--- a/package/libzip/libzip.hash
+++ b/package/libzip/libzip.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  705dac7a671b3f440181481e607b0908129a9cf1ddfcba75d66436c0e7d33641  libzip-1.6.1.tar.xz
+sha256  a020dc1b17a79faa748e43a05f8605d65e403813e8e97ad3a300a90ddba097ac  libzip-1.7.1.tar.xz
 sha256  af6d9141427cf40b7d1fa6d7f5473b06a7faa9f9b0a2ea588eb6ba7b2e1c8a9e  LICENSE
diff --git a/package/libzip/libzip.mk b/package/libzip/libzip.mk
index f021e06b66..c30ad037c3 100644
--- a/package/libzip/libzip.mk
+++ b/package/libzip/libzip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBZIP_VERSION = 1.6.1
+LIBZIP_VERSION = 1.7.1
 LIBZIP_SITE = https://libzip.org/download
 LIBZIP_SOURCE = libzip-$(LIBZIP_VERSION).tar.xz
 LIBZIP_LICENSE = BSD-3-Clause

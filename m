From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Sat, 13 Jun 2020 15:31:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/libzip: bump to version 1.7.1
Message-ID: <1592055093-4172-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See https://github.com/nih-at/libzip/releases

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/libzip/libzip.hash | 2 +-
 package/libzip/libzip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libzip/libzip.hash b/package/libzip/libzip.hash
index af4c9db..1ca4828 100644
--- a/package/libzip/libzip.hash
+++ b/package/libzip/libzip.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  705dac7a671b3f440181481e607b0908129a9cf1ddfcba75d66436c0e7d33641  libzip-1.6.1.tar.xz
+sha256  a020dc1b17a79faa748e43a05f8605d65e403813e8e97ad3a300a90ddba097ac  libzip-1.7.1.tar.xz
 sha256  af6d9141427cf40b7d1fa6d7f5473b06a7faa9f9b0a2ea588eb6ba7b2e1c8a9e  LICENSE
diff --git a/package/libzip/libzip.mk b/package/libzip/libzip.mk
index f021e06..c30ad03 100644
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
-- 
2.7.4

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Jul 2017 00:43:31 +0200
Subject: [Buildroot] [git commit] libzip: bump version to 1.2.0
Message-ID: <20170701224029.7C2F98172B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7b846fc07fbcc3b537a091cb7271164fb2c08a3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's a major release, but the API seems to be mostly
backwards-compatible. The only package depending on this library in
buildroot is libsigrok and it builds fine.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libzip/libzip.hash | 2 +-
 package/libzip/libzip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libzip/libzip.hash b/package/libzip/libzip.hash
index ccd0e6a..103c761 100644
--- a/package/libzip/libzip.hash
+++ b/package/libzip/libzip.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	7cfbbc2c540e154b933b6e9ec781e2671086bd8114eb744ae1a1ade34d2bb6bb	libzip-0.11.2.tar.xz
+sha256	ffc0764395fba3d45dc5a6e32282788854618b9e9838337f8218b596007f1376	libzip-1.2.0.tar.xz
diff --git a/package/libzip/libzip.mk b/package/libzip/libzip.mk
index b873746..a4012dd 100644
--- a/package/libzip/libzip.mk
+++ b/package/libzip/libzip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBZIP_VERSION = 0.11.2
+LIBZIP_VERSION = 1.2.0
 LIBZIP_SITE = http://www.nih.at/libzip
 LIBZIP_SOURCE = libzip-$(LIBZIP_VERSION).tar.xz
 LIBZIP_LICENSE = BSD-3-Clause

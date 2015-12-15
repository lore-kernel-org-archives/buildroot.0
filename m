From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 23:15:55 +0100
Subject: [Buildroot] [git commit] libsodium: bump to version 1.0.6
Message-ID: <20151215221833.431D981DF8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=33065a35a41d8648d1066b2d499cfea6af9b8903
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsodium/libsodium.hash | 4 ++--
 package/libsodium/libsodium.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libsodium/libsodium.hash b/package/libsodium/libsodium.hash
index 089dc03..3544237 100644
--- a/package/libsodium/libsodium.hash
+++ b/package/libsodium/libsodium.hash
@@ -1,2 +1,2 @@
-# Locally computed:
-sha256	cbcfc63cc90c05d18a20f229a62c7e7054a73731d0aa858c0517152c549b1288	libsodium-1.0.3.tar.gz
+# Locally calculated after checking pgp signature
+sha256	940d03ea7d2caa7940e24564bf6d9f66d6edd1df1e0111ff8e3655f3b864fb59	libsodium-1.0.6.tar.gz
diff --git a/package/libsodium/libsodium.mk b/package/libsodium/libsodium.mk
index 18035f3..09bc777 100644
--- a/package/libsodium/libsodium.mk
+++ b/package/libsodium/libsodium.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSODIUM_VERSION = 1.0.3
-LIBSODIUM_SITE = https://github.com/jedisct1/libsodium/releases/download/$(LIBSODIUM_VERSION)
+LIBSODIUM_VERSION = 1.0.6
+LIBSODIUM_SITE = https://download.libsodium.org/libsodium/releases
 LIBSODIUM_LICENSE = ISC
 LIBSODIUM_LICENSE_FILES = LICENSE
 LIBSODIUM_INSTALL_STAGING = YES

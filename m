From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Apr 2017 11:04:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/libsodium: bump version to 1.0.12
Message-ID: <20170429090449.6441-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libsodium/libsodium.hash | 2 +-
 package/libsodium/libsodium.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsodium/libsodium.hash b/package/libsodium/libsodium.hash
index 3b129a0ca..9fdbc1725 100644
--- a/package/libsodium/libsodium.hash
+++ b/package/libsodium/libsodium.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	a14549db3c49f6ae2170cbbf4664bd48ace50681045e8dbea7c8d9fb96f9c765	libsodium-1.0.11.tar.gz
+sha256 b8648f1bb3a54b0251cf4ffa4f0d76ded13977d4fa7517d988f4c902dd8e2f95  libsodium-1.0.12.tar.gz
diff --git a/package/libsodium/libsodium.mk b/package/libsodium/libsodium.mk
index 1d21bb3d8..b951c532e 100644
--- a/package/libsodium/libsodium.mk
+++ b/package/libsodium/libsodium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSODIUM_VERSION = 1.0.11
+LIBSODIUM_VERSION = 1.0.12
 LIBSODIUM_SITE = https://download.libsodium.org/libsodium/releases
 LIBSODIUM_LICENSE = ISC
 LIBSODIUM_LICENSE_FILES = LICENSE
-- 
2.11.0

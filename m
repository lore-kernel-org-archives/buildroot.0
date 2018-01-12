From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 12 Jan 2018 12:58:00 +0200
Subject: [Buildroot] [PATCH] libsodium: bump to version 1.0.16
Message-ID: <fa6dbf1edcd6598f156830b94a6012d0f5c36ac0.1515754680.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add pgp signature reference.

Cc: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libsodium/libsodium.hash | 3 ++-
 package/libsodium/libsodium.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libsodium/libsodium.hash b/package/libsodium/libsodium.hash
index 12f332d72d7f..5cc076364ba7 100644
--- a/package/libsodium/libsodium.hash
+++ b/package/libsodium/libsodium.hash
@@ -1,3 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256 fb6a9e879a2f674592e4328c5d9f79f082405ee4bb05cb6e679b90afe9e178f4  libsodium-1.0.15.tar.gz
+# https://download.libsodium.org/libsodium/releases/libsodium-1.0.16.tar.gz.sig
+sha256 eeadc7e1e1bcef09680fb4837d448fbdf57224978f865ac1c16745868fbd0533  libsodium-1.0.16.tar.gz
 sha256 6faf327c97dca6da69acefc6d3969d7bffb70a24f0707874870fdcfd6b0acf58  LICENSE
diff --git a/package/libsodium/libsodium.mk b/package/libsodium/libsodium.mk
index b45f013d6bb9..ffdd1717ba35 100644
--- a/package/libsodium/libsodium.mk
+++ b/package/libsodium/libsodium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSODIUM_VERSION = 1.0.15
+LIBSODIUM_VERSION = 1.0.16
 LIBSODIUM_SITE = https://github.com/jedisct1/libsodium/releases/download/$(LIBSODIUM_VERSION)
 LIBSODIUM_LICENSE = ISC
 LIBSODIUM_LICENSE_FILES = LICENSE
-- 
2.15.1

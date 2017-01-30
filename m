From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 30 Jan 2017 16:04:30 -0300
Subject: [Buildroot] [PATCH] libsodium: bump to version 1.0.11
Message-ID: <20170130190430.26325-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libsodium/libsodium.hash | 2 +-
 package/libsodium/libsodium.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsodium/libsodium.hash b/package/libsodium/libsodium.hash
index 8b79555..3b129a0 100644
--- a/package/libsodium/libsodium.hash
+++ b/package/libsodium/libsodium.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	c0f191d2527852641e0a996b7b106d2e04cbc76ea50731b2d0babd3409301926	libsodium-1.0.8.tar.gz
+sha256	a14549db3c49f6ae2170cbbf4664bd48ace50681045e8dbea7c8d9fb96f9c765	libsodium-1.0.11.tar.gz
diff --git a/package/libsodium/libsodium.mk b/package/libsodium/libsodium.mk
index a8c28a6..1d21bb3 100644
--- a/package/libsodium/libsodium.mk
+++ b/package/libsodium/libsodium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSODIUM_VERSION = 1.0.8
+LIBSODIUM_VERSION = 1.0.11
 LIBSODIUM_SITE = https://download.libsodium.org/libsodium/releases
 LIBSODIUM_LICENSE = ISC
 LIBSODIUM_LICENSE_FILES = LICENSE
-- 
2.10.2

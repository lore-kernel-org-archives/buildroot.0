From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 12 Apr 2019 22:37:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/libsodium: bump to version 1.0.17
Message-ID: <20190412203734.14053-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update hash of license file (update in year)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libsodium/libsodium.hash | 6 +++---
 package/libsodium/libsodium.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libsodium/libsodium.hash b/package/libsodium/libsodium.hash
index 5cc076364b..d6867997dc 100644
--- a/package/libsodium/libsodium.hash
+++ b/package/libsodium/libsodium.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.libsodium.org/libsodium/releases/libsodium-1.0.16.tar.gz.sig
-sha256 eeadc7e1e1bcef09680fb4837d448fbdf57224978f865ac1c16745868fbd0533  libsodium-1.0.16.tar.gz
-sha256 6faf327c97dca6da69acefc6d3969d7bffb70a24f0707874870fdcfd6b0acf58  LICENSE
+# https://download.libsodium.org/libsodium/releases/libsodium-1.0.17.tar.gz.sig
+sha256 0cc3dae33e642cc187b5ceb467e0ad0e1b51dcba577de1190e9ffa17766ac2b1  libsodium-1.0.17.tar.gz
+sha256 dea1855c9809f3faf22aa4a1fba20ec8af5a5587f23115012e5b98279cedc4af  LICENSE
diff --git a/package/libsodium/libsodium.mk b/package/libsodium/libsodium.mk
index ffdd1717ba..9767c51a22 100644
--- a/package/libsodium/libsodium.mk
+++ b/package/libsodium/libsodium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSODIUM_VERSION = 1.0.16
+LIBSODIUM_VERSION = 1.0.17
 LIBSODIUM_SITE = https://github.com/jedisct1/libsodium/releases/download/$(LIBSODIUM_VERSION)
 LIBSODIUM_LICENSE = ISC
 LIBSODIUM_LICENSE_FILES = LICENSE
-- 
2.14.1

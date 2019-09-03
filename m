From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Sep 2019 13:40:42 -0000
Subject: [Buildroot] [git commit] package/libsodium: bump to version 1.0.18
Message-ID: <20190903133620.4D9D981413@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=17f536fa6e2ec2f26be8599d09123c91ee09fd7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update download location to match installation docs.

Update validation comment to reference Minisign signature.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libsodium/libsodium.hash | 6 +++---
 package/libsodium/libsodium.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libsodium/libsodium.hash b/package/libsodium/libsodium.hash
index d6867997dc..bc7b02d64f 100644
--- a/package/libsodium/libsodium.hash
+++ b/package/libsodium/libsodium.hash
@@ -1,4 +1,4 @@
-# Locally calculated after checking pgp signature
-# https://download.libsodium.org/libsodium/releases/libsodium-1.0.17.tar.gz.sig
-sha256 0cc3dae33e642cc187b5ceb467e0ad0e1b51dcba577de1190e9ffa17766ac2b1  libsodium-1.0.17.tar.gz
+# Locally calculated after checking Minisign signature
+# https://download.libsodium.org/libsodium/releases/libsodium-1.0.18.tar.gz.minisig
+sha256 6f504490b342a4f8a4c4a02fc9b866cbef8622d5df4e5452b46be121e46636c1  libsodium-1.0.18.tar.gz
 sha256 dea1855c9809f3faf22aa4a1fba20ec8af5a5587f23115012e5b98279cedc4af  LICENSE
diff --git a/package/libsodium/libsodium.mk b/package/libsodium/libsodium.mk
index 9767c51a22..a94a8271c5 100644
--- a/package/libsodium/libsodium.mk
+++ b/package/libsodium/libsodium.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSODIUM_VERSION = 1.0.17
-LIBSODIUM_SITE = https://github.com/jedisct1/libsodium/releases/download/$(LIBSODIUM_VERSION)
+LIBSODIUM_VERSION = 1.0.18
+LIBSODIUM_SITE = https://download.libsodium.org/libsodium/releases
 LIBSODIUM_LICENSE = ISC
 LIBSODIUM_LICENSE_FILES = LICENSE
 LIBSODIUM_INSTALL_STAGING = YES

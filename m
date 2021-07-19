From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Jul 2021 23:03:08 +0200
Subject: [Buildroot] [git commit] package/i2pd: bump to version 2.38.0
Message-ID: <20210719203514.18EF388430@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=a244355fa842aa4b457ae64349008c73ab4cdc60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/PurpleI2P/i2pd/blob/2.38.0/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/i2pd/i2pd.hash | 4 ++--
 package/i2pd/i2pd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/i2pd/i2pd.hash b/package/i2pd/i2pd.hash
index e9aa26d5de..da44d51e1b 100644
--- a/package/i2pd/i2pd.hash
+++ b/package/i2pd/i2pd.hash
@@ -1,4 +1,4 @@
-# From https://github.com/PurpleI2P/i2pd/releases/download/2.37.0/SHA512SUMS
-sha512  2cf785941b58563a575511ad2ef8b94ec20bfed10f1a4a06e82603f85c9b9586cf10740fcee0d962cd94bf6059c3950f68f2a0b96b55f1c6de23a7d49014d3e6  i2pd-2.37.0.tar.gz
+# From https://github.com/PurpleI2P/i2pd/releases/download/2.38.0/SHA512SUMS
+sha512  01e160394dc07621b3d236fcc13d78b46e109290f59dbb77f282c05f4d80fdfa01c9b062de5ca91d6d6e739beb8a5b6f731508b48d9483f1a132a93a71d88e6f  i2pd-2.38.0.tar.gz
 # Locally computed:
 sha256  9c87aff490b272254d716475e3c4973f5f64af1d18f9f6962c1e61e252e1ad9a  LICENSE
diff --git a/package/i2pd/i2pd.mk b/package/i2pd/i2pd.mk
index 3aa5602172..e6df5ca34c 100644
--- a/package/i2pd/i2pd.mk
+++ b/package/i2pd/i2pd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-I2PD_VERSION = 2.37.0
+I2PD_VERSION = 2.38.0
 I2PD_SITE = $(call github,PurpleI2P,i2pd,$(I2PD_VERSION))
 I2PD_LICENSE = BSD-3-Clause
 I2PD_LICENSE_FILES = LICENSE

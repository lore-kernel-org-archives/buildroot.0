From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 16 Mar 2021 23:33:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/i2pd: bump to version 2.37.0
Message-ID: <20210316223324.3306985-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://github.com/PurpleI2P/i2pd/blob/2.37.0/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/i2pd/i2pd.hash | 4 ++--
 package/i2pd/i2pd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/i2pd/i2pd.hash b/package/i2pd/i2pd.hash
index 4bfaecab03..e9aa26d5de 100644
--- a/package/i2pd/i2pd.hash
+++ b/package/i2pd/i2pd.hash
@@ -1,4 +1,4 @@
-# From https://github.com/PurpleI2P/i2pd/releases/download/2.35.0/SHA512SUMS
-sha512  cffc41484a63eba7c7091957cd4d8b8584bb02580d70c69132f1447018be5b3cde7893ae4a0bcb914d53e95c089d4253ece6e20442c9da7810e7800a2b99b117  i2pd-2.35.0.tar.gz
+# From https://github.com/PurpleI2P/i2pd/releases/download/2.37.0/SHA512SUMS
+sha512  2cf785941b58563a575511ad2ef8b94ec20bfed10f1a4a06e82603f85c9b9586cf10740fcee0d962cd94bf6059c3950f68f2a0b96b55f1c6de23a7d49014d3e6  i2pd-2.37.0.tar.gz
 # Locally computed:
 sha256  9c87aff490b272254d716475e3c4973f5f64af1d18f9f6962c1e61e252e1ad9a  LICENSE
diff --git a/package/i2pd/i2pd.mk b/package/i2pd/i2pd.mk
index ef6a467d71..3aa5602172 100644
--- a/package/i2pd/i2pd.mk
+++ b/package/i2pd/i2pd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-I2PD_VERSION = 2.35.0
+I2PD_VERSION = 2.37.0
 I2PD_SITE = $(call github,PurpleI2P,i2pd,$(I2PD_VERSION))
 I2PD_LICENSE = BSD-3-Clause
 I2PD_LICENSE_FILES = LICENSE
-- 
2.30.1

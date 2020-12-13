From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Dec 2020 22:04:16 +0100
Subject: [Buildroot] [git commit] package/i2pd: bump to version 2.35.0
Message-ID: <20201213205600.7205984298@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=867c01cbc5d4a2a7dee1022eab653e91af03a6e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of license file (update in year:
https://github.com/PurpleI2P/i2pd/commit/bc330ff0ea134d5d18d927609d3870192829f70f)

https://github.com/PurpleI2P/i2pd/releases/tag/2.34.0
https://github.com/PurpleI2P/i2pd/releases/tag/2.35.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/i2pd/i2pd.hash | 6 +++---
 package/i2pd/i2pd.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/i2pd/i2pd.hash b/package/i2pd/i2pd.hash
index 1a19ccf687..4bfaecab03 100644
--- a/package/i2pd/i2pd.hash
+++ b/package/i2pd/i2pd.hash
@@ -1,4 +1,4 @@
-# From https://github.com/PurpleI2P/i2pd/releases/download/2.33.0/SHA512SUMS
-sha512  7a3e7a8a908be8a12b675fda4ce923cb2b0eaf3e9b12a513b9ae7b56e9ecb593eef0ea278debb4027406d50ee9a46599a6792a54ce2e2f4e2c44c1fc82479910  i2pd-2.33.0.tar.gz
+# From https://github.com/PurpleI2P/i2pd/releases/download/2.35.0/SHA512SUMS
+sha512  cffc41484a63eba7c7091957cd4d8b8584bb02580d70c69132f1447018be5b3cde7893ae4a0bcb914d53e95c089d4253ece6e20442c9da7810e7800a2b99b117  i2pd-2.35.0.tar.gz
 # Locally computed:
-sha256  d147a6acdaf8ec9f6513802ef6cad4a4afcdb5ab6b98d9f6bb26d2b7f4cf454c  LICENSE
+sha256  9c87aff490b272254d716475e3c4973f5f64af1d18f9f6962c1e61e252e1ad9a  LICENSE
diff --git a/package/i2pd/i2pd.mk b/package/i2pd/i2pd.mk
index 461f483d1f..1371e708b9 100644
--- a/package/i2pd/i2pd.mk
+++ b/package/i2pd/i2pd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-I2PD_VERSION = 2.33.0
+I2PD_VERSION = 2.35.0
 I2PD_SITE = $(call github,PurpleI2P,i2pd,$(I2PD_VERSION))
 I2PD_LICENSE = BSD-3-Clause
 I2PD_LICENSE_FILES = LICENSE

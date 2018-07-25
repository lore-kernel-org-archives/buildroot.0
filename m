From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Jul 2018 22:59:39 +0200
Subject: [Buildroot] [git commit] mbedtls: bump to version 2.7.4
Message-ID: <20180725205550.5DE5E8A3BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=023cc02d0a439936c0fc205206b333058bac36c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mbedtls/mbedtls.hash | 6 +++---
 package/mbedtls/mbedtls.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index 16f03fb7d8..cf347d299f 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,5 +1,5 @@
-# From https://tls.mbed.org/tech-updates/releases/mbedtls-2.9.0-2.7.3-and-2.1.12-released
-sha1	8352f6713a9ee695f6f19e893c0e85941af71967	mbedtls-2.7.3-apache.tgz
-sha256	05282af7d95fedb2430c248ffe3081646800b8dae9071f8da11a07100963d765	mbedtls-2.7.3-apache.tgz
+# From https://tls.mbed.org/tech-updates/releases/mbedtls-2.11.0-2.7.4-and-2.1.13-released
+sha1	20394e353050992c5f9699da7c9a336bd2ed2dea	mbedtls-2.7.4-apache.tgz
+sha256	34e164d49500e377970c5f6761a146078baae0e086ec88cdcfeb9c96878a38f5	mbedtls-2.7.4-apache.tgz
 # Locally calculated
 sha256	cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30	apache-2.0.txt
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index e6012dcb3f..ab415dd0b8 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MBEDTLS_SITE = https://tls.mbed.org/code/releases
-MBEDTLS_VERSION = 2.7.3
+MBEDTLS_VERSION = 2.7.4
 MBEDTLS_SOURCE = mbedtls-$(MBEDTLS_VERSION)-apache.tgz
 MBEDTLS_CONF_OPTS = \
 	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_MBEDTLS_PROGRAMS),ON,OFF) \

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Jul 2021 23:31:25 +0200
Subject: [Buildroot] [git commit] package/mbedtls: security bump to version
 2.16.11
Message-ID: <20210716205742.D763891202@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=0683ab9fca3289d443237d7dc79f3c84ddd696a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://tls.mbed.org/tech-updates/security-advisories/mbedtls-security-advisory-2021-07-1
https://tls.mbed.org/tech-updates/security-advisories/mbedtls-security-advisory-2021-07-2

https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.11

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mbedtls/mbedtls.hash | 4 ++--
 package/mbedtls/mbedtls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index d9912a50d9..b93da164f9 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,4 +1,4 @@
-# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.10:
-sha256  96257bb03b30300b2f35f861ffe204ed957e9fd0329d80646fe57fc49f589b29  mbedtls-2.16.10.tar.gz
+# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.11:
+sha256  c18e7e9abf95e69e425260493720470021384a1728417042060a35d0b7b18b41  mbedtls-2.16.11.tar.gz
 # Locally calculated
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  apache-2.0.txt
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index 8776fb9134..9207daf186 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MBEDTLS_VERSION = 2.16.10
+MBEDTLS_VERSION = 2.16.11
 MBEDTLS_SITE = $(call github,ARMmbed,mbedtls,v$(MBEDTLS_VERSION))
 MBEDTLS_CONF_OPTS = \
 	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_MBEDTLS_PROGRAMS),ON,OFF) \

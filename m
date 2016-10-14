From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Oct 2016 09:30:20 +0200
Subject: [Buildroot] [git commit] mbedtls: bump to version 2.3.0
Message-ID: <20161014073026.E3CF37FFE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5239108c33374a2b361276f5dcea50a6d09e19d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mbedtls/mbedtls.hash | 4 ++--
 package/mbedtls/mbedtls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index eebbfe8..2d0fa11 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,2 +1,2 @@
-# From https://tls.mbed.org/tech-updates/releases/mbedtls-2.2.1-2.1.4-1.3.16-and-polarssl.1.2.19-released
-sha256	6ddd5ca2e7dfb43d2fd750400856246fc1c98344dabf01b1594eb2f9880ef7ce	mbedtls-2.2.1-apache.tgz
+# From https://tls.mbed.org/tech-updates/releases/mbedtls-2.3.0-2.1.5-and-1.3.17-released
+sha256	590734c8bc8b3ac48e9123d44bf03562e91f8dce0d1ac2615c318c077f3215b2	mbedtls-2.3.0-apache.tgz
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index 994a3f4..7067beb 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MBEDTLS_SITE = https://tls.mbed.org/code/releases
-MBEDTLS_VERSION = 2.2.1
+MBEDTLS_VERSION = 2.3.0
 MBEDTLS_SOURCE = mbedtls-$(MBEDTLS_VERSION)-apache.tgz
 MBEDTLS_CONF_OPTS = \
 	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_MBEDTLS_PROGRAMS),ON,OFF) \

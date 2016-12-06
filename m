From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Dec 2016 20:20:19 +0100
Subject: [Buildroot] [git commit] mbedtls: bump to version 2.4.0
Message-ID: <20161206193839.2B4C781D5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=34d34e13058d75875e7a90ca1866133fbaeb0c6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This change also fixes
http://autobuild.buildroot.net/results/27b/27b35d03b576392955e21498ac1e62590ef5f5db/build-end.log

Signed-off-by: Rahul Jain <Rahul.Jain@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mbedtls/mbedtls.hash | 2 +-
 package/mbedtls/mbedtls.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index 2d0fa11..5f9786c 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,2 +1,2 @@
 # From https://tls.mbed.org/tech-updates/releases/mbedtls-2.3.0-2.1.5-and-1.3.17-released
-sha256	590734c8bc8b3ac48e9123d44bf03562e91f8dce0d1ac2615c318c077f3215b2	mbedtls-2.3.0-apache.tgz
+sha256	c1c3559ed39f7a1b1550c4cf4ccb918bf239301a3311d98dda92bed8a25b7f0d	mbedtls-2.4.0-apache.tgz
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index d55e16b..a8bd61f 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MBEDTLS_SITE = https://tls.mbed.org/code/releases
-MBEDTLS_VERSION = 2.3.0
+MBEDTLS_VERSION = 2.4.0
 MBEDTLS_SOURCE = mbedtls-$(MBEDTLS_VERSION)-apache.tgz
 MBEDTLS_CONF_OPTS = \
 	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_MBEDTLS_PROGRAMS),ON,OFF) \

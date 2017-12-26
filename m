From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 26 Dec 2017 19:46:29 +0100
Subject: [Buildroot] [git commit] libressl: bump to 2.6.4
Message-ID: <20171226184751.4956A83654@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bed50c767b1f15383fdff9c685866e8c3d482925
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libressl/libressl.hash | 2 +-
 package/libressl/libressl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
index 42f3028..9d926c6 100644
--- a/package/libressl/libressl.hash
+++ b/package/libressl/libressl.hash
@@ -1,2 +1,2 @@
 # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
-sha256	aead6598263171b96970da0d881e616d0813b69b35ebdc5991f87ff2ea7f5c98	libressl-2.6.3.tar.gz
+sha256	638a20c2f9e99ee283a841cd787ab4d846d1880e180c4e96904fc327d419d11f	libressl-2.6.4.tar.gz
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index 0806ff6..2467086 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRESSL_VERSION = 2.6.3
+LIBRESSL_VERSION = 2.6.4
 LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
 LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
 LIBRESSL_LICENSE_FILES = COPYING

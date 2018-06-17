From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jun 2018 20:29:38 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] libressl: security bump
 to version 2.6.5
Message-ID: <20180617182736.0853C88552@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=023442a669b8a2dba3fdf930c7de502c7b479703
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fixes CVE-2018-0495: ECDSA signing side-channel attack.

For more details, see the release notes:

http://bsdsec.net/articles/libressl-2-7-4-2-6-5-released

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libressl/libressl.hash | 2 +-
 package/libressl/libressl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
index 9d926c677b..555a75cf05 100644
--- a/package/libressl/libressl.hash
+++ b/package/libressl/libressl.hash
@@ -1,2 +1,2 @@
 # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
-sha256	638a20c2f9e99ee283a841cd787ab4d846d1880e180c4e96904fc327d419d11f	libressl-2.6.4.tar.gz
+sha256	859edfc71019d27c448fe148e679afdd972a0baa91b21f02b2b2f5f8a84ddd2a	libressl-2.6.5.tar.gz
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index 2467086161..466b0b831b 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRESSL_VERSION = 2.6.4
+LIBRESSL_VERSION = 2.6.5
 LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
 LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
 LIBRESSL_LICENSE_FILES = COPYING

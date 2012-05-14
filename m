From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 May 2012 14:36:17 +0200
Subject: [Buildroot] [git commit] openssl: security bump to version 1.0.0j
Message-ID: <20120514124534.6A9AE96CEA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b108e9b5dd8cfbf8d7f02e602993bdc174febc00
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to version 1.0.0j to fix CVE-2012-2333

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/openssl/openssl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 748252c..62861c5 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-OPENSSL_VERSION = 1.0.0i
+OPENSSL_VERSION = 1.0.0j
 OPENSSL_SITE = http://www.openssl.org/source
 OPENSSL_INSTALL_STAGING = YES
 OPENSSL_DEPENDENCIES = zlib

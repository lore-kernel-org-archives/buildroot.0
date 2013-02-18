From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Feb 2013 13:15:17 +0100
Subject: [Buildroot] [git commit] openssl: bump to version 1.0.1e
Message-ID: <20130218121923.7EA7E9AB53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0ff2d0f74b311c5b235a1294521e0e80bb82af2b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes some regressions introduced by 1.0.1d

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/openssl/openssl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index b4a3674..96f817d 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-OPENSSL_VERSION = 1.0.1d
+OPENSSL_VERSION = 1.0.1e
 OPENSSL_SITE = http://www.openssl.org/source
 OPENSSL_LICENSE = OpenSSL or SSLeay
 OPENSSL_LICENSE_FILES = LICENSE

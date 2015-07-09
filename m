From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  9 Jul 2015 15:45:13 -0300
Subject: [Buildroot] [PATCH] openssl: security bump to version 1.0.2d
Message-ID: <1436467513-27739-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2015-1793 - Alternative chains certificate forgery.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openssl/openssl.hash | 6 ++----
 package/openssl/openssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/openssl/openssl.hash b/package/openssl/openssl.hash
index 4b212fb..355be79 100644
--- a/package/openssl/openssl.hash
+++ b/package/openssl/openssl.hash
@@ -1,4 +1,2 @@
-# From https://www.openssl.org/source/openssl-1.0.2c.tar.gz.md5
-# From https://www.openssl.org/source/openssl-1.0.2c.tar.gz.sha1
-md5	8c8d81a9ae7005276e486702edbcd4b6	openssl-1.0.2c.tar.gz
-sha1	6e4a5e91159eb32383296c7c83ac0e59b83a0a44	openssl-1.0.2c.tar.gz
+# From https://www.openssl.org/source/openssl-1.0.2d.tar.gz.sha256
+sha256	671c36487785628a703374c652ad2cebea45fa920ae5681515df25d9f2c9a8c8	openssl-1.0.2d.tar.gz
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 37c640d..3d87919 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSL_VERSION = 1.0.2c
+OPENSSL_VERSION = 1.0.2d
 OPENSSL_SITE = http://www.openssl.org/source
 OPENSSL_LICENSE = OpenSSL or SSLeay
 OPENSSL_LICENSE_FILES = LICENSE
-- 
2.3.6

From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 19 Jan 2015 17:25:41 -0300
Subject: [Buildroot] [PATCH] openssl: bump to version 1.0.1l
Message-ID: <1421699141-23421-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openssl/openssl.hash | 8 ++++----
 package/openssl/openssl.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/openssl/openssl.hash b/package/openssl/openssl.hash
index 0d27eae..79119f1 100644
--- a/package/openssl/openssl.hash
+++ b/package/openssl/openssl.hash
@@ -1,4 +1,4 @@
-# From https://www.openssl.org/source/openssl-1.0.1k.tar.gz.md5
-# From https://www.openssl.org/source/openssl-1.0.1k.tar.gz.sha1
-md5	d4f002bd22a56881340105028842ae1f	openssl-1.0.1k.tar.gz
-sha1	19d818e202558c212a9583fcdaf876995a633ddf	openssl-1.0.1k.tar.gz
+# From https://www.openssl.org/source/openssl-1.0.1l.tar.gz.md5
+# From https://www.openssl.org/source/openssl-1.0.1l.tar.gz.sha1
+md5	cdb22925fc9bc97ccbf1e007661f2aa6	openssl-1.0.1l.tar.gz
+sha1	4547a0b4269acf76b1f9e7d188896867d6fc8c18	openssl-1.0.1l.tar.gz
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 522224c..9b0d9e4 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSL_VERSION = 1.0.1k
+OPENSSL_VERSION = 1.0.1l
 OPENSSL_SITE = http://www.openssl.org/source
 OPENSSL_LICENSE = OpenSSL or SSLeay
 OPENSSL_LICENSE_FILES = LICENSE
-- 
2.0.5

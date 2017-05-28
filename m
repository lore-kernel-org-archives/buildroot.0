From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 May 2017 12:47:48 +0200
Subject: [Buildroot] [PATCH/next] package/openssl: bump verstion to 1.0.2l
Message-ID: <20170528104748.30727-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

According to https://www.openssl.org/news/newslog.html this release
does not contain security fixes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/openssl/openssl.hash | 4 ++--
 package/openssl/openssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openssl/openssl.hash b/package/openssl/openssl.hash
index 064eeca6f..da911c5ce 100644
--- a/package/openssl/openssl.hash
+++ b/package/openssl/openssl.hash
@@ -1,5 +1,5 @@
-# From https://www.openssl.org/source/openssl-1.0.2k.tar.gz.sha256
-sha256	6b3977c61f2aedf0f96367dcfb5c6e578cf37e7b8d913b4ecb6643c3cb88d8c0	openssl-1.0.2k.tar.gz
+# From https://www.openssl.org/source/openssl-1.0.2l.tar.gz.sha256
+sha256	ce07195b659e75f4e1db43552860070061f156a98bb37b672b101ba6e3ddf30c	openssl-1.0.2l.tar.gz
 # Locally computed
 sha256	eddd8a5123748052c598214487ac178e4bfa4e31ba2ec520c70d59c8c5bfa2e9	openssl-1.0.2a-parallel-install-dirs.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
 sha256	147c3eeaad614c044749ea527cb433eae5e2d5cad34a78c6ba61cd967bfbe01f	openssl-1.0.2a-parallel-obj-headers.patch?id=c8abcbe8de5d3b6cdd68c162f398c011ff6e2d9d
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 1536982f8..5f56b445a 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSL_VERSION = 1.0.2k
+OPENSSL_VERSION = 1.0.2l
 OPENSSL_SITE = http://www.openssl.org/source
 OPENSSL_LICENSE = OpenSSL or SSLeay
 OPENSSL_LICENSE_FILES = LICENSE
-- 
2.11.0

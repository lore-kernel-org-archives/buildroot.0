From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 20 Aug 2018 07:54:39 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/ustream-ssl: bump version
Message-ID: <20180820055439.24125-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This release includes support for OpenSSL 1.1.x

Added hashes for tarball and license file.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ustream-ssl/ustream-ssl.hash | 3 +++
 package/ustream-ssl/ustream-ssl.mk   | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 package/ustream-ssl/ustream-ssl.hash

diff --git a/package/ustream-ssl/ustream-ssl.hash b/package/ustream-ssl/ustream-ssl.hash
new file mode 100644
index 0000000000..ba315f88dc
--- /dev/null
+++ b/package/ustream-ssl/ustream-ssl.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 63ecc9d78ef83020a4539a89c8a3690657e7bbe7580ae02cc0e7b4267ffea5cd  ustream-ssl-23a3f2830341acd1db149175baf7315a33bd0edb.tar.gz
+sha256 90dd1590cf400a548438e2575e1ff46d8fb8cebae7d09f544aae7e059e30b6c5  ustream-ssl.h
diff --git a/package/ustream-ssl/ustream-ssl.mk b/package/ustream-ssl/ustream-ssl.mk
index 9b10788293..7804eb5d38 100644
--- a/package/ustream-ssl/ustream-ssl.mk
+++ b/package/ustream-ssl/ustream-ssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USTREAM_SSL_VERSION = 45ac93088bc6f2d8ef3b0512d8e1ddfd9c4ee9e5
+USTREAM_SSL_VERSION = 23a3f2830341acd1db149175baf7315a33bd0edb
 USTREAM_SSL_SITE = git://git.openwrt.org/project/ustream-ssl.git
 USTREAM_SSL_LICENSE = ISC
 USTREAM_SSL_LICENSE_FILES = ustream-ssl.h
-- 
2.18.0

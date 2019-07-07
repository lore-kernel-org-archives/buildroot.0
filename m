From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 Jul 2019 13:51:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/libxslt: bump version to 1.1.33
Message-ID: <20190707115151.15100-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libxslt/libxslt.hash | 2 +-
 package/libxslt/libxslt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libxslt/libxslt.hash b/package/libxslt/libxslt.hash
index f28150b71e..0326585959 100644
--- a/package/libxslt/libxslt.hash
+++ b/package/libxslt/libxslt.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	526ecd0abaf4a7789041622c3950c0e7f2c4c8835471515fd77eec684a355460	libxslt-1.1.32.tar.gz
+sha256	8e36605144409df979cab43d835002f63988f3dc94d5d3537c12796db90e38c8	libxslt-1.1.33.tar.gz
 
 # Hash for license file:
 sha256	7e48e290b6bfccc2ec1b297023a1d77f2fd87417f71fbb9f50aabef40a851819	COPYING
diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index 4632301b16..d2cef1cb04 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXSLT_VERSION = 1.1.32
+LIBXSLT_VERSION = 1.1.33
 LIBXSLT_SITE = http://xmlsoft.org/sources
 LIBXSLT_INSTALL_STAGING = YES
 LIBXSLT_LICENSE = MIT
-- 
2.20.1

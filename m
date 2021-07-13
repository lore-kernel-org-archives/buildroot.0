From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 13 Jul 2021 13:20:53 +0200
Subject: [Buildroot] [PATCH] package/spi-tools: bump to version 1.0.0
Message-ID: <20210713112053.1157725-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/spi-tools/spi-tools.hash | 2 +-
 package/spi-tools/spi-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/spi-tools/spi-tools.hash b/package/spi-tools/spi-tools.hash
index 771f86e4c..a1ef4c2b9 100644
--- a/package/spi-tools/spi-tools.hash
+++ b/package/spi-tools/spi-tools.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  319ad6ab296111109ea4a820e216cef392429295de7e10e76f7146677337cf09  spi-tools-0.8.6.tar.gz
+sha256  5eb24670461dcf2c58471114dc69b5204dab1c0cc5053878f6de79503bd8cc9f  spi-tools-1.0.0.tar.gz
 sha256  a01259a1b522cf0de95824f9860613b453153eebac468e96196d5d7dba84786c  LICENSE
diff --git a/package/spi-tools/spi-tools.mk b/package/spi-tools/spi-tools.mk
index b2dd4db3f..26d0dcf54 100644
--- a/package/spi-tools/spi-tools.mk
+++ b/package/spi-tools/spi-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPI_TOOLS_VERSION = 0.8.6
+SPI_TOOLS_VERSION = 1.0.0
 SPI_TOOLS_SITE = $(call github,cpb-,spi-tools,$(SPI_TOOLS_VERSION))
 # autoreconf must be run as specified in package documentation
 SPI_TOOLS_AUTORECONF = YES
-- 
2.30.2

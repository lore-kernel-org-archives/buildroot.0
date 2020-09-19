From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 19 Sep 2020 18:42:49 +0200
Subject: [Buildroot] [PATCH] package/spi-tools: bump to version 0.8.5
Message-ID: <20200919164250.672070-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/spi-tools/spi-tools.hash | 4 ++--
 package/spi-tools/spi-tools.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/spi-tools/spi-tools.hash b/package/spi-tools/spi-tools.hash
index eb8073f78..8b7590b33 100644
--- a/package/spi-tools/spi-tools.hash
+++ b/package/spi-tools/spi-tools.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  201ffcb53e64f28a05aa0a8de5686f7ac644268da1305c0d5f70a3d96b4a22ce spi-tools-0.8.4.tar.gz
-sha256  a01259a1b522cf0de95824f9860613b453153eebac468e96196d5d7dba84786c LICENSE
+sha256  a1846bf3b4d38fc419f8efe4555242aa581358fdca28452b3ca11f74e3572e33  spi-tools-0.8.5.tar.gz
+sha256  a01259a1b522cf0de95824f9860613b453153eebac468e96196d5d7dba84786c  LICENSE
diff --git a/package/spi-tools/spi-tools.mk b/package/spi-tools/spi-tools.mk
index c25521a07..1af74c7a1 100644
--- a/package/spi-tools/spi-tools.mk
+++ b/package/spi-tools/spi-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPI_TOOLS_VERSION = 0.8.4
+SPI_TOOLS_VERSION = 0.8.5
 SPI_TOOLS_SITE = $(call github,cpb-,spi-tools,$(SPI_TOOLS_VERSION))
 # autoreconf must be run as specified in package documentation
 SPI_TOOLS_AUTORECONF = YES
-- 
2.25.1

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 4 Jan 2021 23:09:36 +0100
Subject: [Buildroot] [git commit] package/spi-tools: bump to version 0.8.6
Message-ID: <20210104215338.A79ED802EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d64da55160ceca1e7c238db8f9272b41e8ac2ae6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/spi-tools/spi-tools.hash | 2 +-
 package/spi-tools/spi-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/spi-tools/spi-tools.hash b/package/spi-tools/spi-tools.hash
index 8b7590b338..771f86e4cd 100644
--- a/package/spi-tools/spi-tools.hash
+++ b/package/spi-tools/spi-tools.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  a1846bf3b4d38fc419f8efe4555242aa581358fdca28452b3ca11f74e3572e33  spi-tools-0.8.5.tar.gz
+sha256  319ad6ab296111109ea4a820e216cef392429295de7e10e76f7146677337cf09  spi-tools-0.8.6.tar.gz
 sha256  a01259a1b522cf0de95824f9860613b453153eebac468e96196d5d7dba84786c  LICENSE
diff --git a/package/spi-tools/spi-tools.mk b/package/spi-tools/spi-tools.mk
index 1af74c7a1d..b2dd4db3ff 100644
--- a/package/spi-tools/spi-tools.mk
+++ b/package/spi-tools/spi-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPI_TOOLS_VERSION = 0.8.5
+SPI_TOOLS_VERSION = 0.8.6
 SPI_TOOLS_SITE = $(call github,cpb-,spi-tools,$(SPI_TOOLS_VERSION))
 # autoreconf must be run as specified in package documentation
 SPI_TOOLS_AUTORECONF = YES

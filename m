From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 21:55:09 +0200
Subject: [Buildroot] [git commit] package/spi-tools: bump to version 0.8.5
Message-ID: <20200919194742.5B40D82B49@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b299e96454e3674eb2dcbfaaeb30b19ff56e8fc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/spi-tools/spi-tools.hash | 4 ++--
 package/spi-tools/spi-tools.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/spi-tools/spi-tools.hash b/package/spi-tools/spi-tools.hash
index eb8073f783..8b7590b338 100644
--- a/package/spi-tools/spi-tools.hash
+++ b/package/spi-tools/spi-tools.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  201ffcb53e64f28a05aa0a8de5686f7ac644268da1305c0d5f70a3d96b4a22ce spi-tools-0.8.4.tar.gz
-sha256  a01259a1b522cf0de95824f9860613b453153eebac468e96196d5d7dba84786c LICENSE
+sha256  a1846bf3b4d38fc419f8efe4555242aa581358fdca28452b3ca11f74e3572e33  spi-tools-0.8.5.tar.gz
+sha256  a01259a1b522cf0de95824f9860613b453153eebac468e96196d5d7dba84786c  LICENSE
diff --git a/package/spi-tools/spi-tools.mk b/package/spi-tools/spi-tools.mk
index c25521a07f..1af74c7a1d 100644
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

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Jan 2020 17:21:59 +0100
Subject: [Buildroot] [git commit] package/spi-tools: bump to version 0.8.4
Message-ID: <20200105161303.26BF38EC59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0715209aa7bca67f7d0e05eb27b741e17e6ac4f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/spi-tools/spi-tools.hash | 2 +-
 package/spi-tools/spi-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/spi-tools/spi-tools.hash b/package/spi-tools/spi-tools.hash
index 8fe2d3e6b3..eb8073f783 100644
--- a/package/spi-tools/spi-tools.hash
+++ b/package/spi-tools/spi-tools.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  1f29548187c5a57ca5902d260b01ca9ce04d93e4406ff77f317e1d6423ed3610 spi-tools-0.8.3.tar.gz
+sha256  201ffcb53e64f28a05aa0a8de5686f7ac644268da1305c0d5f70a3d96b4a22ce spi-tools-0.8.4.tar.gz
 sha256  a01259a1b522cf0de95824f9860613b453153eebac468e96196d5d7dba84786c LICENSE
diff --git a/package/spi-tools/spi-tools.mk b/package/spi-tools/spi-tools.mk
index d21e4d64dd..c25521a07f 100644
--- a/package/spi-tools/spi-tools.mk
+++ b/package/spi-tools/spi-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPI_TOOLS_VERSION = 0.8.3
+SPI_TOOLS_VERSION = 0.8.4
 SPI_TOOLS_SITE = $(call github,cpb-,spi-tools,$(SPI_TOOLS_VERSION))
 # autoreconf must be run as specified in package documentation
 SPI_TOOLS_AUTORECONF = YES

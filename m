From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Aug 2018 22:22:03 +0200
Subject: [Buildroot] [git commit branch/next] package/spi-tools: bump
 version to 0.8.3
Message-ID: <20180828202233.4A59D814D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=254197612d0a4644d3ef63a234cd4a1deec0049b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/spi-tools/spi-tools.hash | 3 ++-
 package/spi-tools/spi-tools.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/spi-tools/spi-tools.hash b/package/spi-tools/spi-tools.hash
index 25c73814ba..8fe2d3e6b3 100644
--- a/package/spi-tools/spi-tools.hash
+++ b/package/spi-tools/spi-tools.hash
@@ -1,2 +1,3 @@
 # locally computed hash
-sha256	72a6c4a9d13011addc61bc3906543cd06f76f567270ae4b6ca4d0115fd6a9538 spi-tools-0.8.1.tar.gz
+sha256  1f29548187c5a57ca5902d260b01ca9ce04d93e4406ff77f317e1d6423ed3610 spi-tools-0.8.3.tar.gz
+sha256  a01259a1b522cf0de95824f9860613b453153eebac468e96196d5d7dba84786c LICENSE
diff --git a/package/spi-tools/spi-tools.mk b/package/spi-tools/spi-tools.mk
index e5f3774b53..d21e4d64dd 100644
--- a/package/spi-tools/spi-tools.mk
+++ b/package/spi-tools/spi-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPI_TOOLS_VERSION = 0.8.1
+SPI_TOOLS_VERSION = 0.8.3
 SPI_TOOLS_SITE = $(call github,cpb-,spi-tools,$(SPI_TOOLS_VERSION))
 # autoreconf must be run as specified in package documentation
 SPI_TOOLS_AUTORECONF = YES

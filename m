From: Peter Seiderer <ps.report@gmx.net>
Date: Wed,  3 Jun 2020 12:38:48 +0200
Subject: [Buildroot] [PATCH v2 2/3] package/bcm2835: bump version to 1.65
In-Reply-To: <20200603103849.20415-1-ps.report@gmx.net>
References: <20200603103849.20415-1-ps.report@gmx.net>
Message-ID: <20200603103849.20415-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes since 1.63:
 - 1.64 2020-04-11 Fixed error in definitions of BCM2835_AUX_SPI_STAT_TX_LVL
   and BCM2835_AUX_SPI_STAT_RX_LVL
 - 1.65, 1.66 2020-04-16 Added support for use of capability cap_sys_rawio
   to determine if access to /dev/mem is available for non-root users

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - split original patch into three independent ones
---
 package/bcm2835/bcm2835.hash | 2 +-
 package/bcm2835/bcm2835.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bcm2835/bcm2835.hash b/package/bcm2835/bcm2835.hash
index c722a97456..8317e10256 100644
--- a/package/bcm2835/bcm2835.hash
+++ b/package/bcm2835/bcm2835.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  aec4b33ed9ecda4a1c4c12b8ed2abdd13cf87f352f0d27a24be726d11f1fbf54  bcm2835-1.63.tar.gz
+sha256  62955cc8506cc6506d729da3138442beb9763f1ffd536e925aeb0dc223492874  bcm2835-1.65.tar.gz
 sha256  8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b  COPYING
diff --git a/package/bcm2835/bcm2835.mk b/package/bcm2835/bcm2835.mk
index f75b2fc69e..2ef6d94b38 100644
--- a/package/bcm2835/bcm2835.mk
+++ b/package/bcm2835/bcm2835.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BCM2835_VERSION = 1.63
+BCM2835_VERSION = 1.65
 BCM2835_SITE = http://www.airspayce.com/mikem/bcm2835
 BCM2835_LICENSE = GPL-3.0
 BCM2835_LICENSE_FILES = COPYING
-- 
2.26.2

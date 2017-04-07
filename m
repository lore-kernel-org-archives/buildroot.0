From: Baruch Siach <baruch@tkos.co.il>
Date: Fri,  7 Apr 2017 06:40:46 +0300
Subject: [Buildroot] [PATCH 2/2] ethtool: bump to version 4.10
In-Reply-To: <b8a0c47ad82f584df2871486c6754dda036456a5.1491536446.git.baruch@tkos.co.il>
References: <b8a0c47ad82f584df2871486c6754dda036456a5.1491536446.git.baruch@tkos.co.il>
Message-ID: <854b612fdd7d635fd171ca17524a8c5e11a176d6.1491536446.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/ethtool/ethtool.hash | 2 +-
 package/ethtool/ethtool.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
index 7deb92adaeac..4071fb062159 100644
--- a/package/ethtool/ethtool.hash
+++ b/package/ethtool/ethtool.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
-sha256	403dfe288e2d8031eab0be3f5d0ca9128e120d61c52c3dc434474fa026eb4a43	ethtool-4.8.tar.xz
+sha256	f0009726ecf34128b9a8238b71a652847dbc06bd1b877656699b0592b95c74ba	ethtool-4.10.tar.xz
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index 53cdabae8bca..ac67eeadded8 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ETHTOOL_VERSION = 4.8
+ETHTOOL_VERSION = 4.10
 ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPL-2.0
-- 
2.11.0

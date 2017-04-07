From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 7 Apr 2017 22:15:59 +0200
Subject: [Buildroot] [git commit] ethtool: bump to version 4.10
Message-ID: <20170407202025.5C50C8275D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=49a1e65bdf3ad83f6a2e64c5bcbdc3d84b43c273
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ethtool/ethtool.hash | 2 +-
 package/ethtool/ethtool.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
index 7deb92a..4071fb0 100644
--- a/package/ethtool/ethtool.hash
+++ b/package/ethtool/ethtool.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
-sha256	403dfe288e2d8031eab0be3f5d0ca9128e120d61c52c3dc434474fa026eb4a43	ethtool-4.8.tar.xz
+sha256	f0009726ecf34128b9a8238b71a652847dbc06bd1b877656699b0592b95c74ba	ethtool-4.10.tar.xz
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index 53cdaba..ac67eea 100644
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

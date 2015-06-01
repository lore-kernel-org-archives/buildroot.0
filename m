From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Jun 2015 23:55:12 +0200
Subject: [Buildroot] [git commit] ethtool: bump to version 4.0
Message-ID: <20150601220249.6B94881D62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=57a5e6547e3dedb90cd96a6541d1f3b7d209c42e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ethtool/ethtool.hash |    2 +-
 package/ethtool/ethtool.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
index f383037..5fde687 100644
--- a/package/ethtool/ethtool.hash
+++ b/package/ethtool/ethtool.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
-sha256	813ffe59fddd2db423c578448b10e33e2e2d4cc2ba780f1f0c603642b20342f6	ethtool-3.18.tar.xz
+sha256	904887acc7d2f9c35dec04eb0e8a727a3205f346af4f4c95560ea3798de5ecff	ethtool-4.0.tar.xz
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index 24e0f59..c358c62 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ETHTOOL_VERSION = 3.18
+ETHTOOL_VERSION = 4.0
 ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPLv2

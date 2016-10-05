From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  5 Oct 2016 07:39:32 -0300
Subject: [Buildroot] [PATCH] ethtool: bump to version 4.8
Message-ID: <1475663972-1823-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ethtool/ethtool.hash | 2 +-
 package/ethtool/ethtool.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
index 73a25ed..7deb92a 100644
--- a/package/ethtool/ethtool.hash
+++ b/package/ethtool/ethtool.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
-sha256	e90589a9349d008cce8c0510ac4e8878efdc0ddb1b732a9a4cc333b101313415	ethtool-4.6.tar.xz
+sha256	403dfe288e2d8031eab0be3f5d0ca9128e120d61c52c3dc434474fa026eb4a43	ethtool-4.8.tar.xz
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index fb751a4..bb3ed92 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ETHTOOL_VERSION = 4.6
+ETHTOOL_VERSION = 4.8
 ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPLv2
-- 
2.7.3

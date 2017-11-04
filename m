From: Florian Fainelli <f.fainelli@gmail.com>
Date: Sat,  4 Nov 2017 15:02:04 -0700
Subject: [Buildroot] [PATCH] ethtool: Bump to version 4.13
Message-ID: <20171104220204.19409-1-f.fainelli@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 package/ethtool/ethtool.hash | 2 +-
 package/ethtool/ethtool.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
index 77fb6009b67b..39e10ff34e9d 100644
--- a/package/ethtool/ethtool.hash
+++ b/package/ethtool/ethtool.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
-sha256	12d8edaa8064966b8ef19cc44fecc096a68828035b6a1f2c67a27531a718e1b2	ethtool-4.11.tar.xz
+sha256	b7c1a380007d30eaf261a63b3cfc000f9d93f9eb7626dcd48b5d2a733af99cba	ethtool-4.13.tar.xz
 # Locally calculated
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index 225eedd09c5f..991df499a8fd 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ETHTOOL_VERSION = 4.11
+ETHTOOL_VERSION = 4.13
 ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPL-2.0
-- 
2.14.1

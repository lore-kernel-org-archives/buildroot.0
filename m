From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Sep 2017 21:57:01 +0200
Subject: [Buildroot] [git commit] ethtool: bump to version 4.11
Message-ID: <20170905194942.530FC8211F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7be51943fbfc667e5f3553719c2364657e058837
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add license file hash.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ethtool/ethtool.hash | 4 +++-
 package/ethtool/ethtool.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
index 4071fb0..77fb600 100644
--- a/package/ethtool/ethtool.hash
+++ b/package/ethtool/ethtool.hash
@@ -1,2 +1,4 @@
 # From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
-sha256	f0009726ecf34128b9a8238b71a652847dbc06bd1b877656699b0592b95c74ba	ethtool-4.10.tar.xz
+sha256	12d8edaa8064966b8ef19cc44fecc096a68828035b6a1f2c67a27531a718e1b2	ethtool-4.11.tar.xz
+# Locally calculated
+sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index ac67eea..225eedd 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ETHTOOL_VERSION = 4.10
+ETHTOOL_VERSION = 4.11
 ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPL-2.0

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 May 2021 14:29:53 +0200
Subject: [Buildroot] [git commit branch/next] package/ethtool: bump to
 version 5.12
Message-ID: <20210518120158.BDEC98118C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ebf7eb7fff301b354b04c5dba96fc6accd6969f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ethtool/ethtool.hash | 2 +-
 package/ethtool/ethtool.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
index 334ff8d503..536579670f 100644
--- a/package/ethtool/ethtool.hash
+++ b/package/ethtool/ethtool.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
-sha256  817d5396a9307b4c637b435d4c558b8f5f964a1464a035ca3c0180f4cc93cfcf  ethtool-5.10.tar.xz
+sha256  f5ddfa9c75053d8011b8c8c99ec4e2d3c83cd1972f638692d62e37fa3ef36f07  ethtool-5.12.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  5d632934396f90c82dfebe3c9512648bbb6333b406113d0cd331b0e0aa2d34a1  LICENSE
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index c9765eccff..f3e950f212 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ETHTOOL_VERSION = 5.10
+ETHTOOL_VERSION = 5.12
 ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPL-2.0

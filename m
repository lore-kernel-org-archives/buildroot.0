From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Apr 2018 21:44:55 +0200
Subject: [Buildroot] [git commit] ethtool: bump to version 4.15
Message-ID: <20180415194457.68E7788073@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84e26fbb7fb7e3fece7dc4961ee842fdaffda0b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the LICENSE file to license files.

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ethtool/ethtool.hash | 3 ++-
 package/ethtool/ethtool.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
index 39e10ff34e..9704a54b0d 100644
--- a/package/ethtool/ethtool.hash
+++ b/package/ethtool/ethtool.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
-sha256	b7c1a380007d30eaf261a63b3cfc000f9d93f9eb7626dcd48b5d2a733af99cba	ethtool-4.13.tar.xz
+sha256	71f7fd32483ffdc7c6c4d882e230714eb101df0a46cbe396dbeb8ac78f1ef91a	ethtool-4.15.tar.xz
 # Locally calculated
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
+sha256	5d632934396f90c82dfebe3c9512648bbb6333b406113d0cd331b0e0aa2d34a1	LICENSE
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index d8ebba5fae..be587f5083 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-ETHTOOL_VERSION = 4.13
+ETHTOOL_VERSION = 4.15
 ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPL-2.0
-ETHTOOL_LICENSE_FILES = COPYING
+ETHTOOL_LICENSE_FILES = LICENSE COPYING
 ETHTOOL_CONF_OPTS = \
 	$(if $(BR2_PACKAGE_ETHTOOL_PRETTY_PRINT),--enable-pretty-dump,--disable-pretty-dump)
 

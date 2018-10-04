From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Oct 2018 14:37:18 +0200
Subject: [Buildroot] [git commit] package/dvblast: bump version to 3.4
Message-ID: <20181004132323.79DD18CA36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=34bdf6662db5fa03849621b2dc256ec1682a3e00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added md5 hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dvblast/dvblast.hash | 7 +++++--
 package/dvblast/dvblast.mk   | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/dvblast/dvblast.hash b/package/dvblast/dvblast.hash
index decade15ce..b32668fa41 100644
--- a/package/dvblast/dvblast.hash
+++ b/package/dvblast/dvblast.hash
@@ -1,4 +1,7 @@
-# From https://get.videolan.org/dvblast/3.3/dvblast-3.3.tar.bz2
-sha256 3d75d0785bc147d5c3f2360637cf869eec405d83742ae8a211adaf645b963387  dvblast-3.3.tar.bz2
+# From https://get.videolan.org/dvblast/3.4/dvblast-3.4.tar.bz2.md5
+md5 148a26e1207e111f905461cfb1cd106a  dvblast-3.4.tar.bz2
+# From https://get.videolan.org/dvblast/3.4/dvblast-3.4.tar.bz2.sha256
+sha256 7abd45aff738544017350af87ec7ebad00fcfb4e4effd04f35023d504d9b6f44  dvblast-3.4.tar.bz2
+# Locally computed
 sha256 94f68aec169fb6c9937eade757251714d38a56812be5dbfc3973914a71ad8d2d  COPYING
 sha256 2c1bea2f338d46ee6f2712f2c2bf05b874327ca0bec5eb0b7b4fbe208a23677f  COPYING.WTFPL
diff --git a/package/dvblast/dvblast.mk b/package/dvblast/dvblast.mk
index bae6367bef..3571ff3c74 100644
--- a/package/dvblast/dvblast.mk
+++ b/package/dvblast/dvblast.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DVBLAST_VERSION = 3.3
+DVBLAST_VERSION = 3.4
 DVBLAST_SOURCE = dvblast-$(DVBLAST_VERSION).tar.bz2
 DVBLAST_SITE = https://get.videolan.org/dvblast/$(DVBLAST_VERSION)
 DVBLAST_LICENSE = GPL-2.0+, WTFPL

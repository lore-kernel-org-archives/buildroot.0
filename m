From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 21:09:32 +0200
Subject: [Buildroot] [git commit] package/xfsprogs: bump to version 5.2.1
Message-ID: <20190915192528.141158E54D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c1d1a0a81a40e5ca628bb693abf41536a686f43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xfsprogs/xfsprogs.hash | 2 +-
 package/xfsprogs/xfsprogs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xfsprogs/xfsprogs.hash b/package/xfsprogs/xfsprogs.hash
index 839f4add2d..629d6fcf9d 100644
--- a/package/xfsprogs/xfsprogs.hash
+++ b/package/xfsprogs/xfsprogs.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/sha256sums.asc
-sha256 397dc96f51aeeff73d021d3418d3172377b2685f2740ca60525096c070aa3df1  xfsprogs-4.18.0.tar.xz
+sha256 7b500e148cebd08f99e37cf744c7843817b37e7be2a32c4dc57d6ea16e3019ae  xfsprogs-5.2.1.tar.xz
 
 # Hash for license files
 sha256 7ae50a5344af14d6231aff6814632a220b3127da4099aea2c6070fd79c407c1a  LICENSES/GPL-2.0
diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index bbb888707b..43c921aa17 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFSPROGS_VERSION = 4.18.0
+XFSPROGS_VERSION = 5.2.1
 XFSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/fs/xfs/xfsprogs
 XFSPROGS_SOURCE = xfsprogs-$(XFSPROGS_VERSION).tar.xz
 XFSPROGS_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1 (libhandle, few headers)

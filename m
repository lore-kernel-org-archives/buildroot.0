From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 14:03:30 +0200
Subject: [Buildroot] [git commit] package/x11r7/xapp_xcompmgr: bump version
 to 1.1.8
Message-ID: <20190331120004.D013981456@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b675a97e72a9417a9dc51030d1ce1426bf19c673
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added hashes provided by upstream and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xapp_xcompmgr/xapp_xcompmgr.hash | 9 +++++++--
 package/x11r7/xapp_xcompmgr/xapp_xcompmgr.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.hash b/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.hash
index 34c13c19d1..b893d01802 100644
--- a/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.hash
+++ b/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2015-April/002568.html
-sha256	c8049b1a2531313be7469ba9b198d334f0b91cc01efc2b20b9afcb117e4d6892	xcompmgr-1.1.7.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-March/002989.html
+md5 ef8c7d4140c11efb8de4141b3968208c  xcompmgr-1.1.8.tar.bz2
+sha1 7bb28329b4bb687763df2d2c1723cb6ecb20945a  xcompmgr-1.1.8.tar.bz2
+sha256 0b89daf4f060fa3fa83cca862c45d531fef7121b5d06552c1d73d396ad9a7243  xcompmgr-1.1.8.tar.bz2
+sha512 ccf29426ffb0797a53653d1ce152de5eee0cec284811fed4b8e634ea0d948180531e4619d96f47e4f9594432c57322624fe0fdaee2c9200efac427fc0904953d  xcompmgr-1.1.8.tar.bz2
+# Locally computed
+sha256 c843545f72771b3ff95eb88defc2e3ed8f9a1802d9bb6c32c196bb5eec3d3a5d  COPYING
diff --git a/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.mk b/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.mk
index 918c1e50ae..24ebad7bda 100644
--- a/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.mk
+++ b/package/x11r7/xapp_xcompmgr/xapp_xcompmgr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XCOMPMGR_VERSION = 1.1.7
+XAPP_XCOMPMGR_VERSION = 1.1.8
 XAPP_XCOMPMGR_SOURCE = xcompmgr-$(XAPP_XCOMPMGR_VERSION).tar.bz2
 XAPP_XCOMPMGR_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XCOMPMGR_LICENSE = MIT

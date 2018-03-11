From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Mar 2018 09:32:39 +0100
Subject: [Buildroot] [git commit] package/x11r7/xapp_editres: bump version
 to 1.0.7
Message-ID: <20180311084455.A37087F952@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c317465e95d75d6f38f519fde52b5ea07c2a7308
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all upstream hashes and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_editres/xapp_editres.hash | 9 +++++++--
 package/x11r7/xapp_editres/xapp_editres.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_editres/xapp_editres.hash b/package/x11r7/xapp_editres/xapp_editres.hash
index 74fc98d63c..1536795515 100644
--- a/package/x11r7/xapp_editres/xapp_editres.hash
+++ b/package/x11r7/xapp_editres/xapp_editres.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2013-January/002120.html
-sha256	3b66d1240bde853872bbb341c4b8fb029094d0a5d21347a58831f15b162c4df0	editres-1.0.6.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-March/002846.html
+md5 526cf79edc0c5e379aefb21539243f96  editres-1.0.7.tar.bz2
+sha1 389e953ebb5080564a6780cb34b72bafae7f5540  editres-1.0.7.tar.bz2
+sha256 089ad34628e55a779b97e369f55fb12caefc96d684b508d9022eb9e12b775c11  editres-1.0.7.tar.bz2
+sha512 b9c928b556116bf50cf4b6ea779bdc9fedf29f5db3e6a8cc75c122578c92e1cc530a81b226ec24aad183b8ebc2de570f200314b0d9ce7883b6e3306007365b32  editres-1.0.7.tar.bz2
+# Locally computed
+sha256 b1049cf96db2c00428b8313541ab333ec4e06f102955f3edd44f88ec43b0acd6  COPYING
diff --git a/package/x11r7/xapp_editres/xapp_editres.mk b/package/x11r7/xapp_editres/xapp_editres.mk
index 6cc4805f5f..1a947d478e 100644
--- a/package/x11r7/xapp_editres/xapp_editres.mk
+++ b/package/x11r7/xapp_editres/xapp_editres.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_EDITRES_VERSION = 1.0.6
+XAPP_EDITRES_VERSION = 1.0.7
 XAPP_EDITRES_SOURCE = editres-$(XAPP_EDITRES_VERSION).tar.bz2
 XAPP_EDITRES_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_EDITRES_LICENSE = MIT

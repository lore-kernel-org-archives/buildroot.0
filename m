From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 24 Mar 2018 21:54:54 +0100
Subject: [Buildroot] [git commit] package/x11r7/xapp_xeyes: bump version to
 1.1.2
Message-ID: <20180324210427.CE272834AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d3b965253aa7ff3fc4d17e868003f9c886defed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all upstream hashes, added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_xeyes/xapp_xeyes.hash | 9 +++++++--
 package/x11r7/xapp_xeyes/xapp_xeyes.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xeyes/xapp_xeyes.hash b/package/x11r7/xapp_xeyes/xapp_xeyes.hash
index 02eb26b7b9..bbb6a9b08b 100644
--- a/package/x11r7/xapp_xeyes/xapp_xeyes.hash
+++ b/package/x11r7/xapp_xeyes/xapp_xeyes.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2010-November/001552.html
-sha1	efe6116d31a7f69e4fb6038613e52b0960b9b61c	xeyes-1.1.1.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-March/002860.html
+md5 6f0543ec84283df5743eeafc173bea4a  xeyes-1.1.2.tar.bz2
+sha1 458987f8accdbd8abf993ee51030391cf584d2e8  xeyes-1.1.2.tar.bz2
+sha256 57bcec0d2d167af9e5d44d0dbd74c6d7c0f0591cd0608952b23c749fdd910553  xeyes-1.1.2.tar.bz2
+sha512 008d76f03ddabd3d86ad9e52a540504553b94cb7a6743b20cf08897549eb27505667365ab9af21956a1b5ec7297acca8903a326536e6195a30e643cd93297ee0  xeyes-1.1.2.tar.bz2
+# Locally computed
+sha256 d8de1de40e16227d1eb4b19e95117ce3f990f71f71df096a2259b0bc9931e042 COPYING
diff --git a/package/x11r7/xapp_xeyes/xapp_xeyes.mk b/package/x11r7/xapp_xeyes/xapp_xeyes.mk
index 07c12002be..6c7f859d35 100644
--- a/package/x11r7/xapp_xeyes/xapp_xeyes.mk
+++ b/package/x11r7/xapp_xeyes/xapp_xeyes.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XEYES_VERSION = 1.1.1
+XAPP_XEYES_VERSION = 1.1.2
 XAPP_XEYES_SOURCE = xeyes-$(XAPP_XEYES_VERSION).tar.bz2
 XAPP_XEYES_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XEYES_LICENSE = MIT

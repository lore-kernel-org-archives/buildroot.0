From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 24 Mar 2018 22:00:20 +0100
Subject: [Buildroot] [git commit] package/x11r7/xapp_xprop: bump version to
 1.2.3
Message-ID: <20180324210429.0339582719@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d79a584dae78a62e9af3260589d461d8cb88ea00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all upstream hashes, added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_xprop/xapp_xprop.hash | 9 +++++++--
 package/x11r7/xapp_xprop/xapp_xprop.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xprop/xapp_xprop.hash b/package/x11r7/xapp_xprop/xapp_xprop.hash
index 4758979c44..a57d375b84 100644
--- a/package/x11r7/xapp_xprop/xapp_xprop.hash
+++ b/package/x11r7/xapp_xprop/xapp_xprop.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2013-August/002290.html
-sha256	9bee88b1025865ad121f72d32576dd3027af1446774aa8300cce3c261d869bc6	xprop-1.2.2.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-March/002870.html
+md5 4becb3ddc4674d741487189e4ce3d0b6  xprop-1.2.3.tar.bz2
+sha1 77062c08a23cfca76824b7e8f9860678255d6b1a  xprop-1.2.3.tar.bz2
+sha256 d22afb28c86d85fff10a50156a7d0fa930c80ae865d70b26d805fd28a17a521b  xprop-1.2.3.tar.bz2
+sha512 ad7987fec11ae19b7adc3b0f683fc393e95155f3b6c753d1d8744aedcfb360452eee5735a4c380152b286905931515f3e1a28676b5531001eb8dd93b7249916a  xprop-1.2.3.tar.bz2
+# Locally computed
+sha256 f19ff982936cca133b9593a6561c3817512207e0b4c951d0e4eb5956d30d4415 COPYING
diff --git a/package/x11r7/xapp_xprop/xapp_xprop.mk b/package/x11r7/xapp_xprop/xapp_xprop.mk
index 40a8577304..d8063d94c8 100644
--- a/package/x11r7/xapp_xprop/xapp_xprop.mk
+++ b/package/x11r7/xapp_xprop/xapp_xprop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XPROP_VERSION = 1.2.2
+XAPP_XPROP_VERSION = 1.2.3
 XAPP_XPROP_SOURCE = xprop-$(XAPP_XPROP_VERSION).tar.bz2
 XAPP_XPROP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XPROP_LICENSE = MIT

From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 20 Mar 2018 18:17:57 +0100
Subject: [Buildroot] [PATCH v2 19/22] package/x11r7/xapp_xwininfo: bump
 version to 1.1.4
In-Reply-To: <20180320171800.3447-1-bernd.kuhls@t-online.de>
References: <20180320171800.3447-1-bernd.kuhls@t-online.de>
Message-ID: <20180320171800.3447-20-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all upstream hashes, added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xwininfo/xapp_xwininfo.hash | 9 +++++++--
 package/x11r7/xapp_xwininfo/xapp_xwininfo.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xwininfo/xapp_xwininfo.hash b/package/x11r7/xapp_xwininfo/xapp_xwininfo.hash
index 4b891a2084..e3882584c3 100644
--- a/package/x11r7/xapp_xwininfo/xapp_xwininfo.hash
+++ b/package/x11r7/xapp_xwininfo/xapp_xwininfo.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2013-May/002215.html
-sha256	218eb0ea95bd8de7903dfaa26423820c523ad1598be0751d2d8b6a2c23b23ff8	xwininfo-1.1.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-March/002877.html
+md5 9a505b91ae7160bbdec360968d060c83  xwininfo-1.1.4.tar.bz2
+sha1 7364e79d1de7bb612dd98c336c649648c6c081ca  xwininfo-1.1.4.tar.bz2
+sha256 839498aa46b496492a5c65cd42cd2e86e0da88149b0672e90cb91648f8cd5b01  xwininfo-1.1.4.tar.bz2
+sha512 d3ab103a0a311e08d1eabc4346750c21eb7d2fbcdc27cab0989a2624b9cd488911614fcf9832603353450114b1231a8f8262cab16e090a0d458d83ec7b6b959b  xwininfo-1.1.4.tar.bz2
+# Locally computed
+sha256 443d675237c023a47e4886506b72796afbb2633394812027f91d6e8fa433b2af COPYING
diff --git a/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk b/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk
index 8ae5961ee4..7da881a9fc 100644
--- a/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk
+++ b/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XWININFO_VERSION = 1.1.3
+XAPP_XWININFO_VERSION = 1.1.4
 XAPP_XWININFO_SOURCE = xwininfo-$(XAPP_XWININFO_VERSION).tar.bz2
 XAPP_XWININFO_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XWININFO_LICENSE = MIT
-- 
2.11.0

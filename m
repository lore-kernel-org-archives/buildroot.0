From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 16 Jul 2019 22:09:52 +0200
Subject: [Buildroot] [PATCH 3/3] package/x11r7/xapp_xwininfo: bump version
 to 1.1.5
In-Reply-To: <20190716200952.26909-1-bernd.kuhls@t-online.de>
References: <20190716200952.26909-1-bernd.kuhls@t-online.de>
Message-ID: <20190716200952.26909-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Updated _SITE according to release notes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xwininfo/xapp_xwininfo.hash | 10 +++++-----
 package/x11r7/xapp_xwininfo/xapp_xwininfo.mk   |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xapp_xwininfo/xapp_xwininfo.hash b/package/x11r7/xapp_xwininfo/xapp_xwininfo.hash
index e3882584c3..163d5cc404 100644
--- a/package/x11r7/xapp_xwininfo/xapp_xwininfo.hash
+++ b/package/x11r7/xapp_xwininfo/xapp_xwininfo.hash
@@ -1,7 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002877.html
-md5 9a505b91ae7160bbdec360968d060c83  xwininfo-1.1.4.tar.bz2
-sha1 7364e79d1de7bb612dd98c336c649648c6c081ca  xwininfo-1.1.4.tar.bz2
-sha256 839498aa46b496492a5c65cd42cd2e86e0da88149b0672e90cb91648f8cd5b01  xwininfo-1.1.4.tar.bz2
-sha512 d3ab103a0a311e08d1eabc4346750c21eb7d2fbcdc27cab0989a2624b9cd488911614fcf9832603353450114b1231a8f8262cab16e090a0d458d83ec7b6b959b  xwininfo-1.1.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-July/003012.html
+md5 26d46f7ef0588d3392da3ad5802be420  xwininfo-1.1.5.tar.bz2
+sha1 9f67b1eb07c5824d437bf577cf6198962af1aeb7  xwininfo-1.1.5.tar.bz2
+sha256 7a405441dfc476666c744f5fcd1bc8a75abf8b5b1d85db7b88b370982365080e  xwininfo-1.1.5.tar.bz2
+sha512 a3268bbeeeeafac94e589fdd47554a965910d40df7cc3d9c36c7c24fa4f5dd49615484d5916ccb41efca9cd4cf9d8981a4c60953b921220b3f4f57f9cce0e1a6  xwininfo-1.1.5.tar.bz2
 # Locally computed
 sha256 443d675237c023a47e4886506b72796afbb2633394812027f91d6e8fa433b2af COPYING
diff --git a/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk b/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk
index 7da881a9fc..9652487aae 100644
--- a/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk
+++ b/package/x11r7/xapp_xwininfo/xapp_xwininfo.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XWININFO_VERSION = 1.1.4
+XAPP_XWININFO_VERSION = 1.1.5
 XAPP_XWININFO_SOURCE = xwininfo-$(XAPP_XWININFO_VERSION).tar.bz2
-XAPP_XWININFO_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XWININFO_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XWININFO_LICENSE = MIT
 XAPP_XWININFO_LICENSE_FILES = COPYING
 XAPP_XWININFO_DEPENDENCIES = xlib_libX11 xlib_libXmu
-- 
2.20.1

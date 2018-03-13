From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 13 Mar 2018 22:05:27 +0100
Subject: [Buildroot] [PATCH 22/22] package/x11r7/xdata_xcursor-themes: bump
 version to 1.0.5
In-Reply-To: <20180313210527.309-1-bernd.kuhls@t-online.de>
References: <20180313210527.309-1-bernd.kuhls@t-online.de>
Message-ID: <20180313210527.309-22-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all upstream hashes, added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.hash | 9 +++++++--
 package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.hash b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.hash
index e59c848641..6a8c99599f 100644
--- a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.hash
+++ b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2013-July/002271.html
-sha256	e3fd2c05b9df0d88a3d1192c02143295744685f4f9a03db116e206698331bb86	xcursor-themes-1.0.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-March/002882.html
+md5 34a93df23e4aa9ee2832a4af33da3ceb  xcursor-themes-1.0.5.tar.bz2
+sha1 6caae6cdb441003a42305f964c32bac21c34626f  xcursor-themes-1.0.5.tar.bz2
+sha256 ae8381d39096598f7fe93fbd3ab079d93347a989f29e017f399ffcd20c8e1272  xcursor-themes-1.0.5.tar.bz2
+sha512 f41e1de0d5deafba33106dcad81576d1888fca052a962c202f2221104aa2d8236b066d8d8fc3dcfbdc166db63f84e60980dfc54059b20a26c7415de71ed07a5b  xcursor-themes-1.0.5.tar.bz2
+# Locally computed
+sha256 e437aed89c3440a9fe7e19968a3f2eeb97041ef6c9616837a3fd42d0874fc0e6 COPYING
diff --git a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
index a2987a0ff2..048291008b 100644
--- a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
+++ b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDATA_XCURSOR_THEMES_VERSION = 1.0.4
+XDATA_XCURSOR_THEMES_VERSION = 1.0.5
 XDATA_XCURSOR_THEMES_SOURCE = xcursor-themes-$(XDATA_XCURSOR_THEMES_VERSION).tar.bz2
 XDATA_XCURSOR_THEMES_SITE = http://xorg.freedesktop.org/releases/individual/data
 XDATA_XCURSOR_THEMES_LICENSE = MIT
-- 
2.11.0

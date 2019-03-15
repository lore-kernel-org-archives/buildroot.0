From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 15 Mar 2019 19:02:45 +0100
Subject: [Buildroot] [PATCH 19/31] package/x11r7/xdata_xcursor-themes: bump
 version to 1.0.6
In-Reply-To: <20190315180256.20256-1-bernd.kuhls@t-online.de>
References: <20190315180256.20256-1-bernd.kuhls@t-online.de>
Message-ID: <20190315180256.20256-19-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdata_xcursor-themes/xdata_xcursor-themes.hash     | 10 +++++-----
 .../x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.hash b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.hash
index 6a8c99599f..dd8d2ad26d 100644
--- a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.hash
+++ b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.hash
@@ -1,7 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002882.html
-md5 34a93df23e4aa9ee2832a4af33da3ceb  xcursor-themes-1.0.5.tar.bz2
-sha1 6caae6cdb441003a42305f964c32bac21c34626f  xcursor-themes-1.0.5.tar.bz2
-sha256 ae8381d39096598f7fe93fbd3ab079d93347a989f29e017f399ffcd20c8e1272  xcursor-themes-1.0.5.tar.bz2
-sha512 f41e1de0d5deafba33106dcad81576d1888fca052a962c202f2221104aa2d8236b066d8d8fc3dcfbdc166db63f84e60980dfc54059b20a26c7415de71ed07a5b  xcursor-themes-1.0.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-February/002945.html
+md5 aea14eabf40528ec4db18f1cfcf5c458  xcursor-themes-1.0.6.tar.bz2
+sha1 b56fd5bf5b1ada0532a85c27db0d296e392168c5  xcursor-themes-1.0.6.tar.bz2
+sha256 ee1ec574741293abcf66ac14ce7e74add7ac6be7deb8b38179ef010d22354999  xcursor-themes-1.0.6.tar.bz2
+sha512 2ad3586a5571a5ddc0001187362b54b839644916164834213af98e58698044aec4392dd6e1e42f1794fda85c8fedf259b09214a9636bd0e71a1629c710f198d3  xcursor-themes-1.0.6.tar.bz2
 # Locally computed
 sha256 e437aed89c3440a9fe7e19968a3f2eeb97041ef6c9616837a3fd42d0874fc0e6 COPYING
diff --git a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
index 048291008b..c3c5f388e9 100644
--- a/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
+++ b/package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDATA_XCURSOR_THEMES_VERSION = 1.0.5
+XDATA_XCURSOR_THEMES_VERSION = 1.0.6
 XDATA_XCURSOR_THEMES_SOURCE = xcursor-themes-$(XDATA_XCURSOR_THEMES_VERSION).tar.bz2
 XDATA_XCURSOR_THEMES_SITE = http://xorg.freedesktop.org/releases/individual/data
 XDATA_XCURSOR_THEMES_LICENSE = MIT
-- 
2.20.1

From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun,  4 Feb 2018 13:46:34 -0500
Subject: [Buildroot] [PATCH 1/2] xcb-util-image: add license file
Message-ID: <1517769995-13694-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/x11r7/xcb-util-image/xcb-util-image.hash | 2 ++
 package/x11r7/xcb-util-image/xcb-util-image.mk   | 1 +
 2 files changed, 3 insertions(+)

diff --git a/package/x11r7/xcb-util-image/xcb-util-image.hash b/package/x11r7/xcb-util-image/xcb-util-image.hash
index 1cc82ac..a9a2eaa 100644
--- a/package/x11r7/xcb-util-image/xcb-util-image.hash
+++ b/package/x11r7/xcb-util-image/xcb-util-image.hash
@@ -1,2 +1,4 @@
 # From http://lists.x.org/archives/xorg-announce/2014-October/002489.html
 sha256	2db96a37d78831d643538dd1b595d7d712e04bdccf8896a5e18ce0f398ea2ffc	xcb-util-image-0.4.0.tar.bz2
+# License file, locally calculated
+sha256	19672c6153d8c4870abe734fa4dd2197481a311f4788d02ad729be07e116b26b	COPYING
diff --git a/package/x11r7/xcb-util-image/xcb-util-image.mk b/package/x11r7/xcb-util-image/xcb-util-image.mk
index 705b8a7..8ddb0be 100644
--- a/package/x11r7/xcb-util-image/xcb-util-image.mk
+++ b/package/x11r7/xcb-util-image/xcb-util-image.mk
@@ -9,6 +9,7 @@ XCB_UTIL_IMAGE_SITE = http://xcb.freedesktop.org/dist
 XCB_UTIL_IMAGE_SOURCE = xcb-util-image-$(XCB_UTIL_IMAGE_VERSION).tar.bz2
 XCB_UTIL_IMAGE_INSTALL_STAGING = YES
 XCB_UTIL_IMAGE_LICENSE = MIT
+XCB_UTIL_IMAGE_LICENSE_FILES = COPYING
 XCB_UTIL_IMAGE_DEPENDENCIES = xcb-util
 
 $(eval $(autotools-package))
-- 
2.7.4

From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Feb 2018 21:47:45 +0100
Subject: [Buildroot] [git commit] xcb-util-image: add license file
Message-ID: <20180204204933.91CA988377@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b98ffc1885c694edf9d1aa1be7142cf3959d25b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xcb-util-image/xcb-util-image.hash | 2 ++
 package/x11r7/xcb-util-image/xcb-util-image.mk   | 1 +
 2 files changed, 3 insertions(+)

diff --git a/package/x11r7/xcb-util-image/xcb-util-image.hash b/package/x11r7/xcb-util-image/xcb-util-image.hash
index 1cc82ac9b2..a9a2eaab50 100644
--- a/package/x11r7/xcb-util-image/xcb-util-image.hash
+++ b/package/x11r7/xcb-util-image/xcb-util-image.hash
@@ -1,2 +1,4 @@
 # From http://lists.x.org/archives/xorg-announce/2014-October/002489.html
 sha256	2db96a37d78831d643538dd1b595d7d712e04bdccf8896a5e18ce0f398ea2ffc	xcb-util-image-0.4.0.tar.bz2
+# License file, locally calculated
+sha256	19672c6153d8c4870abe734fa4dd2197481a311f4788d02ad729be07e116b26b	COPYING
diff --git a/package/x11r7/xcb-util-image/xcb-util-image.mk b/package/x11r7/xcb-util-image/xcb-util-image.mk
index 705b8a7671..8ddb0be86d 100644
--- a/package/x11r7/xcb-util-image/xcb-util-image.mk
+++ b/package/x11r7/xcb-util-image/xcb-util-image.mk
@@ -9,6 +9,7 @@ XCB_UTIL_IMAGE_SITE = http://xcb.freedesktop.org/dist
 XCB_UTIL_IMAGE_SOURCE = xcb-util-image-$(XCB_UTIL_IMAGE_VERSION).tar.bz2
 XCB_UTIL_IMAGE_INSTALL_STAGING = YES
 XCB_UTIL_IMAGE_LICENSE = MIT
+XCB_UTIL_IMAGE_LICENSE_FILES = COPYING
 XCB_UTIL_IMAGE_DEPENDENCIES = xcb-util
 
 $(eval $(autotools-package))

From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Feb 2018 21:47:56 +0100
Subject: [Buildroot] [git commit] xcb-util-wm: add license file
Message-ID: <20180204204933.A8F5888377@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c267b4967e8d0831a35ea5d1d6ceddc4c38a813
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xcb-util-wm/xcb-util-wm.hash | 2 ++
 package/x11r7/xcb-util-wm/xcb-util-wm.mk   | 1 +
 2 files changed, 3 insertions(+)

diff --git a/package/x11r7/xcb-util-wm/xcb-util-wm.hash b/package/x11r7/xcb-util-wm/xcb-util-wm.hash
index 45a6c95e10..e31228fce0 100644
--- a/package/x11r7/xcb-util-wm/xcb-util-wm.hash
+++ b/package/x11r7/xcb-util-wm/xcb-util-wm.hash
@@ -1,2 +1,4 @@
 # From http://lists.x.org/archives/xorg-announce/2014-February/002401.html
 sha256	28bf8179640eaa89276d2b0f1ce4285103d136be6c98262b6151aaee1d3c2a3f	xcb-util-wm-0.4.1.tar.bz2
+# License file, locally calculated
+sha256	12ab3559977a4b22ae3030b90c64a386e6ec51ab0e4eab1ff530f81a2639400a	COPYING
diff --git a/package/x11r7/xcb-util-wm/xcb-util-wm.mk b/package/x11r7/xcb-util-wm/xcb-util-wm.mk
index 95aeb22aa6..37df3fd92d 100644
--- a/package/x11r7/xcb-util-wm/xcb-util-wm.mk
+++ b/package/x11r7/xcb-util-wm/xcb-util-wm.mk
@@ -9,6 +9,7 @@ XCB_UTIL_WM_SITE = http://xcb.freedesktop.org/dist
 XCB_UTIL_WM_SOURCE = xcb-util-wm-$(XCB_UTIL_WM_VERSION).tar.bz2
 XCB_UTIL_WM_INSTALL_STAGING = YES
 XCB_UTIL_WM_LICENSE = MIT
+XCB_UTIL_WM_LICENSE_FILES = COPYING
 XCB_UTIL_WM_DEPENDENCIES = libxcb
 
 $(eval $(autotools-package))

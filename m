From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 09:49:56 +0200
Subject: [Buildroot] [git commit] package/x11r7/xcb-util-image: bump version
	to 0.4.0, add hash
Message-ID: <20150419075429.958ED81938@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0597c92b0a4515a1c721118ff5e6e9bc78419a2e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xcb-util-image/xcb-util-image.hash |    2 ++
 package/x11r7/xcb-util-image/xcb-util-image.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xcb-util-image/xcb-util-image.hash b/package/x11r7/xcb-util-image/xcb-util-image.hash
new file mode 100644
index 0000000..1cc82ac
--- /dev/null
+++ b/package/x11r7/xcb-util-image/xcb-util-image.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2014-October/002489.html
+sha256	2db96a37d78831d643538dd1b595d7d712e04bdccf8896a5e18ce0f398ea2ffc	xcb-util-image-0.4.0.tar.bz2
diff --git a/package/x11r7/xcb-util-image/xcb-util-image.mk b/package/x11r7/xcb-util-image/xcb-util-image.mk
index 6978236..705b8a7 100644
--- a/package/x11r7/xcb-util-image/xcb-util-image.mk
+++ b/package/x11r7/xcb-util-image/xcb-util-image.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XCB_UTIL_IMAGE_VERSION = 0.3.9
+XCB_UTIL_IMAGE_VERSION = 0.4.0
 XCB_UTIL_IMAGE_SITE = http://xcb.freedesktop.org/dist
 XCB_UTIL_IMAGE_SOURCE = xcb-util-image-$(XCB_UTIL_IMAGE_VERSION).tar.bz2
 XCB_UTIL_IMAGE_INSTALL_STAGING = YES

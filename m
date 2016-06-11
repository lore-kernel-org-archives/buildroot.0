From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jun 2016 16:42:40 +0200
Subject: [Buildroot] [git commit] package/x11r7/xcb-proto: bump version to
	1.12
Message-ID: <20160611144302.CD52981D65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7b60a3c2335a0937c757ec63578486ebac1cc27d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xcb-proto/xcb-proto.hash | 4 ++--
 package/x11r7/xcb-proto/xcb-proto.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xcb-proto/xcb-proto.hash b/package/x11r7/xcb-proto/xcb-proto.hash
index c9a9108..3f43485 100644
--- a/package/x11r7/xcb-proto/xcb-proto.hash
+++ b/package/x11r7/xcb-proto/xcb-proto.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/xcb/2014-August/009614.html
-sha256	b4aceee6502a0ce45fc39b33c541a2df4715d00b72e660ebe8c5bb444771e32e	xcb-proto-1.11.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2016-May/002693.html
+sha256	5922aba4c664ab7899a29d92ea91a87aa4c1fc7eb5ee550325c3216c480a4906	xcb-proto-1.12.tar.bz2
diff --git a/package/x11r7/xcb-proto/xcb-proto.mk b/package/x11r7/xcb-proto/xcb-proto.mk
index 931573a..1c847eb 100644
--- a/package/x11r7/xcb-proto/xcb-proto.mk
+++ b/package/x11r7/xcb-proto/xcb-proto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XCB_PROTO_VERSION = 1.11
+XCB_PROTO_VERSION = 1.12
 XCB_PROTO_SOURCE = xcb-proto-$(XCB_PROTO_VERSION).tar.bz2
 XCB_PROTO_SITE = http://xcb.freedesktop.org/dist
 XCB_PROTO_LICENSE = MIT

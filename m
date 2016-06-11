From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Jun 2016 10:37:25 +0200
Subject: [Buildroot] [PATCH 2/9] package/x11r7/xcb-proto: bump version to
	1.12
In-Reply-To: <1465634252-30741-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465634252-30741-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1465634252-30741-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
-- 
2.8.1

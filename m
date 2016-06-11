From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Jun 2016 10:37:26 +0200
Subject: [Buildroot] [PATCH 3/9] package/x11r7/xcb-util-cursor: bump version
	to 0.1.3
In-Reply-To: <1465634252-30741-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465634252-30741-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1465634252-30741-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xcb-util-cursor/xcb-util-cursor.hash | 4 ++--
 package/x11r7/xcb-util-cursor/xcb-util-cursor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xcb-util-cursor/xcb-util-cursor.hash b/package/x11r7/xcb-util-cursor/xcb-util-cursor.hash
index e5c47ca..36f2258 100644
--- a/package/x11r7/xcb-util-cursor/xcb-util-cursor.hash
+++ b/package/x11r7/xcb-util-cursor/xcb-util-cursor.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2015-March/002555.html
-sha1	b55a92cd96c3ec1be9a26963df6d5f16e68fffea	xcb-util-cursor-0.1.2.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2016-May/002691.html
+sha1	26562eb6d4151307f7b6a53453d360ecfc0563ac	xcb-util-cursor-0.1.3.tar.bz2
diff --git a/package/x11r7/xcb-util-cursor/xcb-util-cursor.mk b/package/x11r7/xcb-util-cursor/xcb-util-cursor.mk
index 65704a1..07b37c5 100644
--- a/package/x11r7/xcb-util-cursor/xcb-util-cursor.mk
+++ b/package/x11r7/xcb-util-cursor/xcb-util-cursor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XCB_UTIL_CURSOR_VERSION = 0.1.2
+XCB_UTIL_CURSOR_VERSION = 0.1.3
 XCB_UTIL_CURSOR_SITE = http://xcb.freedesktop.org/dist
 XCB_UTIL_CURSOR_SOURCE = xcb-util-cursor-$(XCB_UTIL_CURSOR_VERSION).tar.bz2
 XCB_UTIL_CURSOR_LICENSE = MIT
-- 
2.8.1

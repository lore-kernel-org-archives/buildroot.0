From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Nov 2020 12:21:29 +0100
Subject: [Buildroot] [PATCH/next 4/6] package/x11r7/xcb-proto: bump version
 to 1.14.1
In-Reply-To: <20201121112131.756930-1-bernd.kuhls@t-online.de>
References: <20201121112131.756930-1-bernd.kuhls@t-online.de>
Message-ID: <20201121112131.756930-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reformatted hashes, updated _SITE.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xcb-proto/xcb-proto.hash | 8 ++++----
 package/x11r7/xcb-proto/xcb-proto.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xcb-proto/xcb-proto.hash b/package/x11r7/xcb-proto/xcb-proto.hash
index c6d2d8e341..e6bc2379bf 100644
--- a/package/x11r7/xcb-proto/xcb-proto.hash
+++ b/package/x11r7/xcb-proto/xcb-proto.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2020-February/003038.html
-sha256 186a3ceb26f9b4a015f5a44dcc814c93033a5fc39684f36f1ecc79834416a605  xcb-proto-1.14.tar.xz
-sha512 de66d568163b6da2be9d6c59984f3afa3acd119a781378638045fd68018665ef5c9af98f024e9962ba3eb7c7a4d85c27ba70ffafceb2324ccc6940f34de16690  xcb-proto-1.14.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2020-October/003061.html
+sha256  f04add9a972ac334ea11d9d7eb4fc7f8883835da3e4859c9afa971efdf57fcc3  xcb-proto-1.14.1.tar.xz
+sha512  140fbf48483bacc7f6b70fdcf76f9e4ff0e87df9cb3a071cea47d8fe4574407cdefcfbd674099014d297e5fc010748e71d8609fca4cc32e8b25c634f928b727d  xcb-proto-1.14.1.tar.xz
 # Locally computed
-sha256 c5ffbfeaa501071ceeb97b7de2c0d703fdaa35de01c0fb6cbac1c28453a3e9fd  COPYING
+sha256  c5ffbfeaa501071ceeb97b7de2c0d703fdaa35de01c0fb6cbac1c28453a3e9fd  COPYING
diff --git a/package/x11r7/xcb-proto/xcb-proto.mk b/package/x11r7/xcb-proto/xcb-proto.mk
index f7a3ad55b1..8bfe24f848 100644
--- a/package/x11r7/xcb-proto/xcb-proto.mk
+++ b/package/x11r7/xcb-proto/xcb-proto.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XCB_PROTO_VERSION = 1.14
+XCB_PROTO_VERSION = 1.14.1
 XCB_PROTO_SOURCE = xcb-proto-$(XCB_PROTO_VERSION).tar.xz
-XCB_PROTO_SITE = http://xcb.freedesktop.org/dist
+XCB_PROTO_SITE = https://xorg.freedesktop.org/archive/individual/proto
 XCB_PROTO_LICENSE = MIT
 XCB_PROTO_LICENSE_FILES = COPYING
 
-- 
2.27.0

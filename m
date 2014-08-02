From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  2 Aug 2014 11:18:31 +0200
Subject: [Buildroot] [PATCH 1/2] xcb-proto: Bump version to 1.11
In-Reply-To: <1406971112-28226-1-git-send-email-bernd.kuhls@t-online.de>
References: <1406971112-28226-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1406971112-28226-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xcb-proto/xcb-proto.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xcb-proto/xcb-proto.mk b/package/x11r7/xcb-proto/xcb-proto.mk
index d08f74a..3cd1b18 100644
--- a/package/x11r7/xcb-proto/xcb-proto.mk
+++ b/package/x11r7/xcb-proto/xcb-proto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XCB_PROTO_VERSION = 1.10
+XCB_PROTO_VERSION = 1.11
 XCB_PROTO_SOURCE = xcb-proto-$(XCB_PROTO_VERSION).tar.bz2
 XCB_PROTO_SITE = http://xcb.freedesktop.org/dist
 XCB_PROTO_LICENSE = MIT
-- 
1.7.10.4

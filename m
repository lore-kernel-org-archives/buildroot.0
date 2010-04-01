From: Will Wagner <will_wagner@carallon.com>
Date: Thu,  1 Apr 2010 13:46:37 +0100
Subject: [Buildroot] [PATCH 07/16] xproto_dri2proto: bump version
In-Reply-To: <1270126006-22405-1-git-send-email-will_wagner@carallon.com>
References: <1270126006-22405-1-git-send-email-will_wagner@carallon.com>
Message-ID: <1270126006-22405-7-git-send-email-will_wagner@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 package/x11r7/xproto_dri2proto/Config.in           |    2 +-
 package/x11r7/xproto_dri2proto/xproto_dri2proto.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xproto_dri2proto/Config.in b/package/x11r7/xproto_dri2proto/Config.in
index 4ab5ccd..a5c82b2 100644
--- a/package/x11r7/xproto_dri2proto/Config.in
+++ b/package/x11r7/xproto_dri2proto/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XPROTO_DRI2PROTO
 	bool "dri2proto"
 	help
-	  dri2proto 2.1
+	  dri2proto 2.3
 	  X.Org DRI2 protocol headers
diff --git a/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk b/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk
index 2d7de30..f3b37c9 100644
--- a/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk
+++ b/package/x11r7/xproto_dri2proto/xproto_dri2proto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_DRI2PROTO_VERSION = 2.1
+XPROTO_DRI2PROTO_VERSION = 2.3
 XPROTO_DRI2PROTO_SOURCE = dri2proto-$(XPROTO_DRI2PROTO_VERSION).tar.bz2
 XPROTO_DRI2PROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_DRI2PROTO_AUTORECONF = NO
-- 
1.7.0

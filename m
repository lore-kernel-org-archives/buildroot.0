From: Will Wagner <will_wagner@carallon.com>
Date: Thu,  1 Apr 2010 13:46:38 +0100
Subject: [Buildroot] [PATCH 08/16] xproto_fontcacheproto: bump version
In-Reply-To: <1270126006-22405-1-git-send-email-will_wagner@carallon.com>
References: <1270126006-22405-1-git-send-email-will_wagner@carallon.com>
Message-ID: <1270126006-22405-8-git-send-email-will_wagner@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 package/x11r7/xproto_fontcacheproto/Config.in      |    2 +-
 .../xproto_fontcacheproto/xproto_fontcacheproto.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xproto_fontcacheproto/Config.in b/package/x11r7/xproto_fontcacheproto/Config.in
index 1c47b5c..1a58863 100644
--- a/package/x11r7/xproto_fontcacheproto/Config.in
+++ b/package/x11r7/xproto_fontcacheproto/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XPROTO_FONTCACHEPROTO
 	bool "fontcacheproto"
 	help
-	  fontcacheproto 0.1.2
+	  fontcacheproto 0.1.3
 	  X.Org Fontcache protocol headers
diff --git a/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk b/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
index 27cf30b..9c2ef47 100644
--- a/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
+++ b/package/x11r7/xproto_fontcacheproto/xproto_fontcacheproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_FONTCACHEPROTO_VERSION = 0.1.2
+XPROTO_FONTCACHEPROTO_VERSION = 0.1.3
 XPROTO_FONTCACHEPROTO_SOURCE = fontcacheproto-$(XPROTO_FONTCACHEPROTO_VERSION).tar.bz2
 XPROTO_FONTCACHEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_FONTCACHEPROTO_AUTORECONF = NO
-- 
1.7.0

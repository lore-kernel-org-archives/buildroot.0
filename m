From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 15 Jul 2015 20:11:42 +0200
Subject: [Buildroot] [PATCH 03/15] package/x11r7/xproto_xproto: bump version
	to 7.0.28
In-Reply-To: <1436983914-7858-1-git-send-email-bernd.kuhls@t-online.de>
References: <1436983914-7858-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1436983914-7858-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xproto_xproto/xproto_xproto.hash |    4 ++--
 package/x11r7/xproto_xproto/xproto_xproto.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xproto_xproto/xproto_xproto.hash b/package/x11r7/xproto_xproto/xproto_xproto.hash
index 6c5a24d..333ac6d 100644
--- a/package/x11r7/xproto_xproto/xproto_xproto.hash
+++ b/package/x11r7/xproto_xproto/xproto_xproto.hash
@@ -1,2 +1,2 @@
-# From http://comments.gmane.org/gmane.comp.freedesktop.xorg.announce/2243
-sha256	246f23a6b235c8008183deeb1dcd76d529a099f93600b648b399811b10ea110c	xproto-7.0.27.tar.bz2
+# From http://lists.x.org/archives/xorg-announce/2015-July/002618.html
+sha256	29e85568d1f68ceef8a2c081dad9bc0e5500a53cfffde24b564dc43d46ddf6ca	xproto-7.0.28.tar.bz2
diff --git a/package/x11r7/xproto_xproto/xproto_xproto.mk b/package/x11r7/xproto_xproto/xproto_xproto.mk
index 99d63f5..7357b8c 100644
--- a/package/x11r7/xproto_xproto/xproto_xproto.mk
+++ b/package/x11r7/xproto_xproto/xproto_xproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_XPROTO_VERSION = 7.0.27
+XPROTO_XPROTO_VERSION = 7.0.28
 XPROTO_XPROTO_SOURCE = xproto-$(XPROTO_XPROTO_VERSION).tar.bz2
 XPROTO_XPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_XPROTO_LICENSE = MIT
-- 
1.7.10.4

From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump fontsproto to 2.1.0
Message-ID: <20100308133700.571AD776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=aba4208e187c145606882363274861549fc3ce49
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xproto_fontsproto/Config.in          |    2 +-
 .../x11r7/xproto_fontsproto/xproto_fontsproto.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xproto_fontsproto/Config.in b/package/x11r7/xproto_fontsproto/Config.in
index 4983c7e..11e4079 100644
--- a/package/x11r7/xproto_fontsproto/Config.in
+++ b/package/x11r7/xproto_fontsproto/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XPROTO_FONTSPROTO
 	bool "fontsproto"
 	help
-	  fontsproto 2.0.2
+	  fontsproto 2.1.0
 	  X.Org Fonts protocol headers
diff --git a/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk b/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
index 324c443..dc18399 100644
--- a/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
+++ b/package/x11r7/xproto_fontsproto/xproto_fontsproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_FONTSPROTO_VERSION = 2.0.2
+XPROTO_FONTSPROTO_VERSION = 2.1.0
 XPROTO_FONTSPROTO_SOURCE = fontsproto-$(XPROTO_FONTSPROTO_VERSION).tar.bz2
 XPROTO_FONTSPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_FONTSPROTO_AUTORECONF = NO
-- 
1.6.3.3

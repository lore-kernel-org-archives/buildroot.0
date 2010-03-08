From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump applewmproto to 1.4.1
Message-ID: <20100308133659.9487B776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=468a0032ad81ee37e146685630d5073d8cc6b702
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xproto_applewmproto/Config.in        |    2 +-
 .../xproto_applewmproto/xproto_applewmproto.mk     |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xproto_applewmproto/Config.in b/package/x11r7/xproto_applewmproto/Config.in
index f3561ed..bc677d9 100644
--- a/package/x11r7/xproto_applewmproto/Config.in
+++ b/package/x11r7/xproto_applewmproto/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XPROTO_APPLEWMPROTO
 	bool "applewmproto"
 	help
-	  applewmproto 1.0.3
+	  applewmproto 1.4.1
 	  No description available
diff --git a/package/x11r7/xproto_applewmproto/xproto_applewmproto.mk b/package/x11r7/xproto_applewmproto/xproto_applewmproto.mk
index 4c7f3c5..189c24f 100644
--- a/package/x11r7/xproto_applewmproto/xproto_applewmproto.mk
+++ b/package/x11r7/xproto_applewmproto/xproto_applewmproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_APPLEWMPROTO_VERSION = 1.0.3
+XPROTO_APPLEWMPROTO_VERSION = 1.4.1
 XPROTO_APPLEWMPROTO_SOURCE = applewmproto-$(XPROTO_APPLEWMPROTO_VERSION).tar.bz2
 XPROTO_APPLEWMPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_APPLEWMPROTO_AUTORECONF = NO
-- 
1.6.3.3

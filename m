From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump bigreqsproto to 1.1.0
Message-ID: <20100308133615.E8D18776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fd06f4cd7078503bba52fee7c401f45623997a3e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xproto_bigreqsproto/Config.in        |    2 +-
 .../xproto_bigreqsproto/xproto_bigreqsproto.mk     |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xproto_bigreqsproto/Config.in b/package/x11r7/xproto_bigreqsproto/Config.in
index e0bcb8c..10616c0 100644
--- a/package/x11r7/xproto_bigreqsproto/Config.in
+++ b/package/x11r7/xproto_bigreqsproto/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XPROTO_BIGREQSPROTO
 	bool "bigreqsproto"
 	help
-	  bigreqsproto 1.0.2
+	  bigreqsproto 1.1.0
 	  X.Org BigReqs protocol headers
diff --git a/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk b/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk
index 5e91a6f..7ae7795 100644
--- a/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk
+++ b/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_BIGREQSPROTO_VERSION = 1.0.2
+XPROTO_BIGREQSPROTO_VERSION = 1.1.0
 XPROTO_BIGREQSPROTO_SOURCE = bigreqsproto-$(XPROTO_BIGREQSPROTO_VERSION).tar.bz2
 XPROTO_BIGREQSPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_BIGREQSPROTO_AUTORECONF = NO
-- 
1.6.3.3

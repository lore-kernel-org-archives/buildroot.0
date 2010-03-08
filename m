From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump fixesproto to 4.1.1
Message-ID: <20100308133614.B2758776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=97346903eb35cd49cb77fe3dab58ac991c37459c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xproto_fixesproto/Config.in          |    2 +-
 .../x11r7/xproto_fixesproto/xproto_fixesproto.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xproto_fixesproto/Config.in b/package/x11r7/xproto_fixesproto/Config.in
index 4a1dcf0..a8b9fc7 100644
--- a/package/x11r7/xproto_fixesproto/Config.in
+++ b/package/x11r7/xproto_fixesproto/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XPROTO_FIXESPROTO
 	bool "fixesproto"
 	help
-	  fixesproto 4.0
+	  fixesproto 4.1.1
 	  X.Org Fixes protocol headers
diff --git a/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk b/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
index 5db3764..1395e0c 100644
--- a/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
+++ b/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_FIXESPROTO_VERSION = 4.0
+XPROTO_FIXESPROTO_VERSION = 4.1.1
 XPROTO_FIXESPROTO_SOURCE = fixesproto-$(XPROTO_FIXESPROTO_VERSION).tar.bz2
 XPROTO_FIXESPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_FIXESPROTO_AUTORECONF = NO
-- 
1.6.3.3

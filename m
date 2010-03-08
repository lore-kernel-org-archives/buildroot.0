From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xcmiscproto to 1.2.0
Message-ID: <20100308133615.61F52776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=257ace04f46e104b9076b3634682f442928cfd07
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xproto_xcmiscproto/Config.in         |    2 +-
 .../x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xproto_xcmiscproto/Config.in b/package/x11r7/xproto_xcmiscproto/Config.in
index 54f71cd..49fd718 100644
--- a/package/x11r7/xproto_xcmiscproto/Config.in
+++ b/package/x11r7/xproto_xcmiscproto/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XPROTO_XCMISCPROTO
 	bool "xcmiscproto"
 	help
-	  xcmiscproto 1.1.2
+	  xcmiscproto 1.2.0
 	  X.Org XCMisc protocol headers
diff --git a/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk b/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
index d8b4784..9c85d9f 100644
--- a/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
+++ b/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_XCMISCPROTO_VERSION = 1.1.2
+XPROTO_XCMISCPROTO_VERSION = 1.2.0
 XPROTO_XCMISCPROTO_SOURCE = xcmiscproto-$(XPROTO_XCMISCPROTO_VERSION).tar.bz2
 XPROTO_XCMISCPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_XCMISCPROTO_AUTORECONF = NO
-- 
1.6.3.3

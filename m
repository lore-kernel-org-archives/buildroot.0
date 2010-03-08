From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump dmxproto to 2.3
Message-ID: <20100308133659.4E96D776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=22b8ec728670cc550189cb5bf5fc17e764357cf4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xproto_dmxproto/Config.in          |    2 +-
 package/x11r7/xproto_dmxproto/xproto_dmxproto.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xproto_dmxproto/Config.in b/package/x11r7/xproto_dmxproto/Config.in
index 02fb2bd..7dc2918 100644
--- a/package/x11r7/xproto_dmxproto/Config.in
+++ b/package/x11r7/xproto_dmxproto/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XPROTO_DMXPROTO
 	bool "dmxproto"
 	help
-	  dmxproto 2.2.2
+	  dmxproto 2.3
 	  X.Org DMX protocol headers
diff --git a/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk b/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk
index 0922654..ff31e7e 100644
--- a/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk
+++ b/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_DMXPROTO_VERSION = 2.2.2
+XPROTO_DMXPROTO_VERSION = 2.3
 XPROTO_DMXPROTO_SOURCE = dmxproto-$(XPROTO_DMXPROTO_VERSION).tar.bz2
 XPROTO_DMXPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_DMXPROTO_AUTORECONF = NO
-- 
1.6.3.3

From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump damageproto to 1.2.0
Message-ID: <20100308133700.19834776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0314d1674b92e098a6330d4c2da388bd139c2c31
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xproto_damageproto/Config.in         |    2 +-
 .../x11r7/xproto_damageproto/xproto_damageproto.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xproto_damageproto/Config.in b/package/x11r7/xproto_damageproto/Config.in
index 0cabe18..1152f32 100644
--- a/package/x11r7/xproto_damageproto/Config.in
+++ b/package/x11r7/xproto_damageproto/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XPROTO_DAMAGEPROTO
 	bool "damageproto"
 	help
-	  damageproto 1.0.3
+	  damageproto 1.2.0
 	  X.Org Damage protocol headers
diff --git a/package/x11r7/xproto_damageproto/xproto_damageproto.mk b/package/x11r7/xproto_damageproto/xproto_damageproto.mk
index 731ca4c..a2f8c71 100644
--- a/package/x11r7/xproto_damageproto/xproto_damageproto.mk
+++ b/package/x11r7/xproto_damageproto/xproto_damageproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_DAMAGEPROTO_VERSION = 1.1.0
+XPROTO_DAMAGEPROTO_VERSION = 1.2.0
 XPROTO_DAMAGEPROTO_SOURCE = damageproto-$(XPROTO_DAMAGEPROTO_VERSION).tar.bz2
 XPROTO_DAMAGEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_DAMAGEPROTO_AUTORECONF = NO
-- 
1.6.3.3

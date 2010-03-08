From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump kbproto to 1.0.4
Message-ID: <20100308133700.CA68E776E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ad1b9d89cf976354de3c0b068c81d416028b7830
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xproto_kbproto/Config.in         |    2 +-
 package/x11r7/xproto_kbproto/xproto_kbproto.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xproto_kbproto/Config.in b/package/x11r7/xproto_kbproto/Config.in
index d8b3d6d..69711e3 100644
--- a/package/x11r7/xproto_kbproto/Config.in
+++ b/package/x11r7/xproto_kbproto/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XPROTO_KBPROTO
 	bool "kbproto"
 	help
-	  kbproto 1.0.3
+	  kbproto 1.0.4
 	  X.Org KB protocol headers
diff --git a/package/x11r7/xproto_kbproto/xproto_kbproto.mk b/package/x11r7/xproto_kbproto/xproto_kbproto.mk
index 63ca105..802bae4 100644
--- a/package/x11r7/xproto_kbproto/xproto_kbproto.mk
+++ b/package/x11r7/xproto_kbproto/xproto_kbproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_KBPROTO_VERSION = 1.0.3
+XPROTO_KBPROTO_VERSION = 1.0.4
 XPROTO_KBPROTO_SOURCE = kbproto-$(XPROTO_KBPROTO_VERSION).tar.bz2
 XPROTO_KBPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_KBPROTO_AUTORECONF = NO
-- 
1.6.3.3

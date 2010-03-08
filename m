From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump randrproto to 1.3.1
Message-ID: <20100308133614.2617A776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c480192f32b1a3557f00010edaad4ee1da13eb33
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xproto_randrproto/Config.in          |    2 +-
 .../x11r7/xproto_randrproto/xproto_randrproto.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xproto_randrproto/Config.in b/package/x11r7/xproto_randrproto/Config.in
index b17f430..4b54775 100644
--- a/package/x11r7/xproto_randrproto/Config.in
+++ b/package/x11r7/xproto_randrproto/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XPROTO_RANDRPROTO
 	bool "randrproto"
 	help
-	  randrproto 1.1.2
+	  randrproto 1.3.1
 	  X.Org Randr protocol headers
diff --git a/package/x11r7/xproto_randrproto/xproto_randrproto.mk b/package/x11r7/xproto_randrproto/xproto_randrproto.mk
index dee2b13..e6befea 100644
--- a/package/x11r7/xproto_randrproto/xproto_randrproto.mk
+++ b/package/x11r7/xproto_randrproto/xproto_randrproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_RANDRPROTO_VERSION = 1.2.1
+XPROTO_RANDRPROTO_VERSION = 1.3.1
 XPROTO_RANDRPROTO_SOURCE = randrproto-$(XPROTO_RANDRPROTO_VERSION).tar.bz2
 XPROTO_RANDRPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_RANDRPROTO_AUTORECONF = NO
-- 
1.6.3.3

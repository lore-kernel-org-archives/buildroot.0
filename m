From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 7 Nov 2012 20:26:13 +0100
Subject: [Buildroot] [git commit] xapp_mkfontdir: bump to 1.0.7
Message-ID: <20121107194000.7076F99C35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=41a625c4b48db66ff626d65c524eaca71afcfd40
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk b/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
index fa4e990..e32ed85 100644
--- a/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
+++ b/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_MKFONTDIR_VERSION = 1.0.6
+XAPP_MKFONTDIR_VERSION = 1.0.7
 XAPP_MKFONTDIR_SOURCE = mkfontdir-$(XAPP_MKFONTDIR_VERSION).tar.bz2
 XAPP_MKFONTDIR_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_MKFONTDIR_DEPENDENCIES = xapp_mkfontscale

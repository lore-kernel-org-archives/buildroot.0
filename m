From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 14:44:42 +0200
Subject: [Buildroot] [git commit] xproto_renderproto: version bump to 0.11.1
Message-ID: <20120922194137.3DDA8995DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cae99aa41caa9eecc1f6d0a9d1e0c8ac10ae6638
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Allan W. Nielsen <a@awn.dk>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../x11r7/xproto_renderproto/xproto_renderproto.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xproto_renderproto/xproto_renderproto.mk b/package/x11r7/xproto_renderproto/xproto_renderproto.mk
index a1a0f59..4ef04a2 100644
--- a/package/x11r7/xproto_renderproto/xproto_renderproto.mk
+++ b/package/x11r7/xproto_renderproto/xproto_renderproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_RENDERPROTO_VERSION = 0.11
+XPROTO_RENDERPROTO_VERSION = 0.11.1
 XPROTO_RENDERPROTO_SOURCE = renderproto-$(XPROTO_RENDERPROTO_VERSION).tar.bz2
 XPROTO_RENDERPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_RENDERPROTO_INSTALL_STAGING = YES

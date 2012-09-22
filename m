From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 14:43:13 +0200
Subject: [Buildroot] [git commit] xproto_xf86driproto: version bump to 2.1.1
Message-ID: <20120922194134.84E39995DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7889705f0b745c15e73331e543e979e015c33d7a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Allan W. Nielsen <a@awn.dk>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../xproto_xf86driproto/xproto_xf86driproto.mk     |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk b/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk
index 701b464..21eb6de 100644
--- a/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk
+++ b/package/x11r7/xproto_xf86driproto/xproto_xf86driproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_XF86DRIPROTO_VERSION = 2.1.0
+XPROTO_XF86DRIPROTO_VERSION = 2.1.1
 XPROTO_XF86DRIPROTO_SOURCE = xf86driproto-$(XPROTO_XF86DRIPROTO_VERSION).tar.bz2
 XPROTO_XF86DRIPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_XF86DRIPROTO_INSTALL_STAGING = YES

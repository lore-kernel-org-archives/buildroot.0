From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 14:44:10 +0200
Subject: [Buildroot] [git commit] xproto_xcmiscproto: version bump to 1.2.1
Message-ID: <20120922194135.9EDE9995DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ac9d04510b960b7f64b7ae571095be25dd777e6e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Allan W. Nielsen <a@awn.dk>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk b/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
index 165521c..8168b5c 100644
--- a/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
+++ b/package/x11r7/xproto_xcmiscproto/xproto_xcmiscproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_XCMISCPROTO_VERSION = 1.2.0
+XPROTO_XCMISCPROTO_VERSION = 1.2.1
 XPROTO_XCMISCPROTO_SOURCE = xcmiscproto-$(XPROTO_XCMISCPROTO_VERSION).tar.bz2
 XPROTO_XCMISCPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_XCMISCPROTO_INSTALL_STAGING = YES

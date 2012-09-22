From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 14:43:31 +0200
Subject: [Buildroot] [git commit] xproto_xextproto: version bump to 7.2.0
Message-ID: <20120922194135.36E5B995DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1f88a5cbe80c9d571c45bd8058e49df179161328
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Allan W. Nielsen <a@awn.dk>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xproto_xextproto/xproto_xextproto.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xproto_xextproto/xproto_xextproto.mk b/package/x11r7/xproto_xextproto/xproto_xextproto.mk
index b47c685..19c7968 100644
--- a/package/x11r7/xproto_xextproto/xproto_xextproto.mk
+++ b/package/x11r7/xproto_xextproto/xproto_xextproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_XEXTPROTO_VERSION = 7.1.1
+XPROTO_XEXTPROTO_VERSION = 7.2.0
 XPROTO_XEXTPROTO_SOURCE = xextproto-$(XPROTO_XEXTPROTO_VERSION).tar.bz2
 XPROTO_XEXTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_XEXTPROTO_INSTALL_STAGING = YES

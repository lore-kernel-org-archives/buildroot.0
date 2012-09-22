From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 14:47:31 +0200
Subject: [Buildroot] [git commit] xproto_dmxproto: version bump to 2.3.1
Message-ID: <20120922194140.AF172995DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0eb66c7d08c2abe3a6724eec1d8902ad96f02077
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Allan W. Nielsen <a@awn.dk>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xproto_dmxproto/xproto_dmxproto.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk b/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk
index a13691b..3277992 100644
--- a/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk
+++ b/package/x11r7/xproto_dmxproto/xproto_dmxproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_DMXPROTO_VERSION = 2.3
+XPROTO_DMXPROTO_VERSION = 2.3.1
 XPROTO_DMXPROTO_SOURCE = dmxproto-$(XPROTO_DMXPROTO_VERSION).tar.bz2
 XPROTO_DMXPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_DMXPROTO_INSTALL_STAGING = YES

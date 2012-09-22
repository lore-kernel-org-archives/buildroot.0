From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 14:46:23 +0200
Subject: [Buildroot] [git commit] xproto_glproto: version bump to 1.4.12
Message-ID: <20120922194139.5B692995DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9d5a7bf6bc4dc80161411e511862c17a34009d1f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Allan W. Nielsen <a@awn.dk>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xproto_glproto/xproto_glproto.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xproto_glproto/xproto_glproto.mk b/package/x11r7/xproto_glproto/xproto_glproto.mk
index aed8af6..f576d0d 100644
--- a/package/x11r7/xproto_glproto/xproto_glproto.mk
+++ b/package/x11r7/xproto_glproto/xproto_glproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_GLPROTO_VERSION = 1.4.10
+XPROTO_GLPROTO_VERSION = 1.4.12
 XPROTO_GLPROTO_SOURCE = glproto-$(XPROTO_GLPROTO_VERSION).tar.bz2
 XPROTO_GLPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_GLPROTO_INSTALL_STAGING = YES

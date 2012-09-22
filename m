From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 14:42:31 +0200
Subject: [Buildroot] [git commit] xproto_xineramaproto: version bump to 1.2.1
Message-ID: <20120922194133.98E45995DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=58335d4de12f188f3f15799c68f7b7245bb4cfb5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Allan W. Nielsen <a@awn.dk>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../xproto_xineramaproto/xproto_xineramaproto.mk   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk b/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk
index 6220ae6..b9d65a4 100644
--- a/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk
+++ b/package/x11r7/xproto_xineramaproto/xproto_xineramaproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_XINERAMAPROTO_VERSION = 1.2
+XPROTO_XINERAMAPROTO_VERSION = 1.2.1
 XPROTO_XINERAMAPROTO_SOURCE = xineramaproto-$(XPROTO_XINERAMAPROTO_VERSION).tar.bz2
 XPROTO_XINERAMAPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_XINERAMAPROTO_INSTALL_STAGING = YES

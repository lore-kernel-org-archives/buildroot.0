From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 14:44:12 +0200
Subject: [Buildroot] [git commit] xproto_videoproto: version bump to 2.3.1
Message-ID: <20120922194136.40A91995DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2fdfb8694b8ee508497cd58a5e806dd3d1336a36
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Allan W. Nielsen <a@awn.dk>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../x11r7/xproto_videoproto/xproto_videoproto.mk   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xproto_videoproto/xproto_videoproto.mk b/package/x11r7/xproto_videoproto/xproto_videoproto.mk
index 88ac3ef..5959977 100644
--- a/package/x11r7/xproto_videoproto/xproto_videoproto.mk
+++ b/package/x11r7/xproto_videoproto/xproto_videoproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_VIDEOPROTO_VERSION = 2.3.0
+XPROTO_VIDEOPROTO_VERSION = 2.3.1
 XPROTO_VIDEOPROTO_SOURCE = videoproto-$(XPROTO_VIDEOPROTO_VERSION).tar.bz2
 XPROTO_VIDEOPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_VIDEOPROTO_INSTALL_STAGING = YES

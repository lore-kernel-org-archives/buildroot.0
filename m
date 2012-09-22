From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 14:48:30 +0200
Subject: [Buildroot] [git commit] xproto_bigreqsproto: version bump to 1.1.1
Message-ID: <20120922194142.3F2019963C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=beee5a000b5abe70825b5acadcdf3d0b5e88dbc1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Allan W. Nielsen <a@awn.dk>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../xproto_bigreqsproto/xproto_bigreqsproto.mk     |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk b/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk
index ca0a533..dc236fa 100644
--- a/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk
+++ b/package/x11r7/xproto_bigreqsproto/xproto_bigreqsproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_BIGREQSPROTO_VERSION = 1.1.0
+XPROTO_BIGREQSPROTO_VERSION = 1.1.1
 XPROTO_BIGREQSPROTO_SOURCE = bigreqsproto-$(XPROTO_BIGREQSPROTO_VERSION).tar.bz2
 XPROTO_BIGREQSPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_BIGREQSPROTO_INSTALL_STAGING = YES

From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 14:47:01 +0200
Subject: [Buildroot] [git commit] xproto_fixesproto: version bump to 5.0
Message-ID: <20120922194140.45E36995DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=10d2c654ac048d8fbff20e44cab27a6240d5ec48
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Allan W. Nielsen <a@awn.dk>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../x11r7/xproto_fixesproto/xproto_fixesproto.mk   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk b/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
index 1141337..ae4d687 100644
--- a/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
+++ b/package/x11r7/xproto_fixesproto/xproto_fixesproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_FIXESPROTO_VERSION = 4.1.1
+XPROTO_FIXESPROTO_VERSION = 5.0
 XPROTO_FIXESPROTO_SOURCE = fixesproto-$(XPROTO_FIXESPROTO_VERSION).tar.bz2
 XPROTO_FIXESPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_FIXESPROTO_INSTALL_STAGING = YES

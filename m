From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 14:47:32 +0200
Subject: [Buildroot] [git commit] xproto_damageproto: version bump to 1.2.1
Message-ID: <20120922194141.0DDA39963C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=18c372a4c956513da69dd28c40c09d5ad212dabc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Allan W. Nielsen <a@awn.dk>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../x11r7/xproto_damageproto/xproto_damageproto.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xproto_damageproto/xproto_damageproto.mk b/package/x11r7/xproto_damageproto/xproto_damageproto.mk
index 918127b..09fe866 100644
--- a/package/x11r7/xproto_damageproto/xproto_damageproto.mk
+++ b/package/x11r7/xproto_damageproto/xproto_damageproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_DAMAGEPROTO_VERSION = 1.2.0
+XPROTO_DAMAGEPROTO_VERSION = 1.2.1
 XPROTO_DAMAGEPROTO_SOURCE = damageproto-$(XPROTO_DAMAGEPROTO_VERSION).tar.bz2
 XPROTO_DAMAGEPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_DAMAGEPROTO_INSTALL_STAGING = YES

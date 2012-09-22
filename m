From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 21:34:53 +0200
Subject: [Buildroot] [git commit] xdriver_x86-input-void: bump version
Message-ID: <20120922194148.E22779963C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5a1ad0df4f69f517353bcaaf08dde2d27045b418
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../xdriver_xf86-input-void.mk                     |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk b/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk
index bffd978..191467d 100644
--- a/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk
+++ b/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_VOID_VERSION = 1.3.0
+XDRIVER_XF86_INPUT_VOID_VERSION = 1.3.1
 XDRIVER_XF86_INPUT_VOID_SOURCE = xf86-input-void-$(XDRIVER_XF86_INPUT_VOID_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_VOID_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_VOID_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto

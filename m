From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 21:34:52 +0200
Subject: [Buildroot] [git commit] xdriver_x86-input-aiptek: bump version
Message-ID: <20120922194146.2F061996DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=95b1f13ad0bdf9c40e13218621c5f38f3855e90d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../xdriver_xf86-input-aiptek.mk                   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk b/package/x11r7/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk
index bc274a7..5e48a74 100644
--- a/package/x11r7/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk
+++ b/package/x11r7/xdriver_xf86-input-aiptek/xdriver_xf86-input-aiptek.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_AIPTEK_VERSION = 1.3.0
+XDRIVER_XF86_INPUT_AIPTEK_VERSION = 1.3.1
 XDRIVER_XF86_INPUT_AIPTEK_SOURCE = xf86-input-aiptek-$(XDRIVER_XF86_INPUT_AIPTEK_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_AIPTEK_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_AIPTEK_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto

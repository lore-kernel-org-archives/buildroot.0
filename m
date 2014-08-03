From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Aug 2014 10:19:11 +0200
Subject: [Buildroot] [git commit] xapp_xrandr: Bump version to 1.4.3
Message-ID: <20140803083010.006339D37B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6b2606d9cbdde092f45205acb7274b553017d0ce
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xrandr/xapp_xrandr.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xrandr/xapp_xrandr.mk b/package/x11r7/xapp_xrandr/xapp_xrandr.mk
index 3a0a021..16bd2c7 100644
--- a/package/x11r7/xapp_xrandr/xapp_xrandr.mk
+++ b/package/x11r7/xapp_xrandr/xapp_xrandr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XRANDR_VERSION = 1.4.2
+XAPP_XRANDR_VERSION = 1.4.3
 XAPP_XRANDR_SOURCE = xrandr-$(XAPP_XRANDR_VERSION).tar.bz2
 XAPP_XRANDR_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XRANDR_LICENSE = MIT

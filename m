From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 23:15:32 +0100
Subject: [Buildroot] [git commit] xapp_xrandr: Bump version to 1.4.2
Message-ID: <20140329222158.D315B9C42C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ae56032b47cca60d825d543cb7a5bba0565a3156
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xrandr/xapp_xrandr.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xrandr/xapp_xrandr.mk b/package/x11r7/xapp_xrandr/xapp_xrandr.mk
index 7e03d29..3a0a021 100644
--- a/package/x11r7/xapp_xrandr/xapp_xrandr.mk
+++ b/package/x11r7/xapp_xrandr/xapp_xrandr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XRANDR_VERSION = 1.4.1
+XAPP_XRANDR_VERSION = 1.4.2
 XAPP_XRANDR_SOURCE = xrandr-$(XAPP_XRANDR_VERSION).tar.bz2
 XAPP_XRANDR_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XRANDR_LICENSE = MIT

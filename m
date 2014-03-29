From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 23:17:06 +0100
Subject: [Buildroot] [git commit] xapp_xprop: Bump version to 1.2.2
Message-ID: <20140329222159.2C6E29C42C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1938534b0b00bc59b39dcd604ba187d232ab3ca6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xprop/xapp_xprop.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xprop/xapp_xprop.mk b/package/x11r7/xapp_xprop/xapp_xprop.mk
index 956e484..40a8577 100644
--- a/package/x11r7/xapp_xprop/xapp_xprop.mk
+++ b/package/x11r7/xapp_xprop/xapp_xprop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XPROP_VERSION = 1.2.1
+XAPP_XPROP_VERSION = 1.2.2
 XAPP_XPROP_SOURCE = xprop-$(XAPP_XPROP_VERSION).tar.bz2
 XAPP_XPROP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XPROP_LICENSE = MIT

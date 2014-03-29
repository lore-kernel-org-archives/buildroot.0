From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 23:19:10 +0100
Subject: [Buildroot] [git commit] xapp_bitmap: Bump version to 1.0.7
Message-ID: <20140329222159.56FE59C42C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=258bfed4fc31d9b2488dd1034a65d437657871a8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_bitmap/xapp_bitmap.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_bitmap/xapp_bitmap.mk b/package/x11r7/xapp_bitmap/xapp_bitmap.mk
index bfe7246..5c4dc1c 100644
--- a/package/x11r7/xapp_bitmap/xapp_bitmap.mk
+++ b/package/x11r7/xapp_bitmap/xapp_bitmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_BITMAP_VERSION = 1.0.6
+XAPP_BITMAP_VERSION = 1.0.7
 XAPP_BITMAP_SOURCE = bitmap-$(XAPP_BITMAP_VERSION).tar.bz2
 XAPP_BITMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_BITMAP_LICENSE = MIT

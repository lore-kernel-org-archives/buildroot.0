From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 30 Jan 2012 15:46:23 +0100
Subject: [Buildroot] [PATCH 1/3] xapp_xinit: bump to 1.3.2
Message-ID: <1327934785-3957-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/x11r7/xapp_xinit/xapp_xinit.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xinit/xapp_xinit.mk b/package/x11r7/xapp_xinit/xapp_xinit.mk
index 48637f2..dc1decf 100644
--- a/package/x11r7/xapp_xinit/xapp_xinit.mk
+++ b/package/x11r7/xapp_xinit/xapp_xinit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XINIT_VERSION = 1.2.1
+XAPP_XINIT_VERSION = 1.3.2
 XAPP_XINIT_SOURCE = xinit-$(XAPP_XINIT_VERSION).tar.bz2
 XAPP_XINIT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XINIT_DEPENDENCIES = xapp_xauth xlib_libX11
-- 
1.7.1.1

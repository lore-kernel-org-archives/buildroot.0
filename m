From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 15 Oct 2012 11:46:17 +0200
Subject: [Buildroot] [PATCH 2/3] xapp_xclock: bump to 1.0.6
In-Reply-To: <1350294378-20956-1-git-send-email-yegorslists@googlemail.com>
References: <1350294378-20956-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1350294378-20956-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/x11r7/xapp_xclock/xapp_xclock.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xapp_xclock/xapp_xclock.mk b/package/x11r7/xapp_xclock/xapp_xclock.mk
index 9fdc792..6d7bf65 100644
--- a/package/x11r7/xapp_xclock/xapp_xclock.mk
+++ b/package/x11r7/xapp_xclock/xapp_xclock.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XCLOCK_VERSION = 1.0.3
+XAPP_XCLOCK_VERSION = 1.0.6
 XAPP_XCLOCK_SOURCE = xclock-$(XAPP_XCLOCK_VERSION).tar.bz2
 XAPP_XCLOCK_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XCLOCK_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXft xlib_libXrender xlib_libxkbfile
-- 
1.7.7

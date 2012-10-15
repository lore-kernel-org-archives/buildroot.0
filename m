From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 15 Oct 2012 11:46:18 +0200
Subject: [Buildroot] [PATCH 3/3] xlib_libXrender: bump to 0.9.7
In-Reply-To: <1350294378-20956-1-git-send-email-yegorslists@googlemail.com>
References: <1350294378-20956-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1350294378-20956-3-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/x11r7/xlib_libXrender/xlib_libXrender.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xlib_libXrender/xlib_libXrender.mk b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
index 466b433..fbd5015 100644
--- a/package/x11r7/xlib_libXrender/xlib_libXrender.mk
+++ b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXRENDER_VERSION = 0.9.6
+XLIB_LIBXRENDER_VERSION = 0.9.7
 XLIB_LIBXRENDER_SOURCE = libXrender-$(XLIB_LIBXRENDER_VERSION).tar.bz2
 XLIB_LIBXRENDER_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXRENDER_INSTALL_STAGING = YES
-- 
1.7.7

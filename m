From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 19 Jul 2014 15:53:20 +0200
Subject: [Buildroot] [PATCH 4/7] xlib_libXft: Bump version to 2.3.2
In-Reply-To: <1405778003-2712-1-git-send-email-bernd.kuhls@t-online.de>
References: <1405778003-2712-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1405778003-2712-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libXft/xlib_libXft.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xlib_libXft/xlib_libXft.mk b/package/x11r7/xlib_libXft/xlib_libXft.mk
index 37f4434..de9b470 100644
--- a/package/x11r7/xlib_libXft/xlib_libXft.mk
+++ b/package/x11r7/xlib_libXft/xlib_libXft.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXFT_VERSION = 2.3.1
+XLIB_LIBXFT_VERSION = 2.3.2
 XLIB_LIBXFT_SOURCE = libXft-$(XLIB_LIBXFT_VERSION).tar.bz2
 XLIB_LIBXFT_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXFT_LICENSE = MIT
-- 
1.7.10.4

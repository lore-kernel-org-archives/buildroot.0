From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  2 Jun 2014 21:38:44 +0200
Subject: [Buildroot] [PATCH 1/1] xapp_twm: Depends on host-bison
Message-ID: <1401737924-23156-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes http://autobuild.buildroot.net/results/c68/c680a2fec88861f20a2cbb17078537a62924dab9/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_twm/xapp_twm.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xapp_twm/xapp_twm.mk b/package/x11r7/xapp_twm/xapp_twm.mk
index e004b8d..de2d8f6 100644
--- a/package/x11r7/xapp_twm/xapp_twm.mk
+++ b/package/x11r7/xapp_twm/xapp_twm.mk
@@ -9,6 +9,6 @@ XAPP_TWM_SOURCE = twm-$(XAPP_TWM_VERSION).tar.bz2
 XAPP_TWM_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_TWM_LICENSE = MIT
 XAPP_TWM_LICENSE_FILES = COPYING
-XAPP_TWM_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXt xlib_libXmu
+XAPP_TWM_DEPENDENCIES = host-bison xlib_libX11 xlib_libXext xlib_libXt xlib_libXmu
 
 $(eval $(autotools-package))
-- 
1.7.10.4

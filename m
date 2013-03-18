From: Jesper Baekdahl <jbb@gamblify.com>
Date: Mon, 18 Mar 2013 13:53:09 +0100
Subject: [Buildroot] [PATCH 029/120] xpp_xlsatoms: bump revision to X11R7.7
In-Reply-To: <1363611219-26971-1-git-send-email-jbb@gamblify.com>
References: <1363611219-26971-1-git-send-email-jbb@gamblify.com>
Message-ID: <1363611219-26971-30-git-send-email-jbb@gamblify.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Will Wagner <will_wagner@carallon.com>

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Jesper Baekdahl <jbb@gamblify.com>
---
 package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk b/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk
index 1863ca6..c10f5c2 100644
--- a/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk
+++ b/package/x11r7/xapp_xlsatoms/xapp_xlsatoms.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XLSATOMS_VERSION = 1.1.0
+XAPP_XLSATOMS_VERSION = 1.1.1
 XAPP_XLSATOMS_SOURCE = xlsatoms-$(XAPP_XLSATOMS_VERSION).tar.bz2
 XAPP_XLSATOMS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XLSATOMS_DEPENDENCIES = xlib_libX11 xlib_libXmu
-- 
1.7.10.4

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Nov 2012 18:23:56 +0100
Subject: [Buildroot] [PATCH 07/12] xapp_xditview: bump version to 1.0.2 to
	fix Xmu related build failure
In-Reply-To: <cover.1353086601.git.thomas.petazzoni@free-electrons.com>
References: <cover.1353086601.git.thomas.petazzoni@free-electrons.com>
Message-ID: <2a1435cda46dc63b8e441f27c055a3c271e168d1.1353086601.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xditview/xapp_xditview.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xapp_xditview/xapp_xditview.mk b/package/x11r7/xapp_xditview/xapp_xditview.mk
index 00d6038..773ed21 100644
--- a/package/x11r7/xapp_xditview/xapp_xditview.mk
+++ b/package/x11r7/xapp_xditview/xapp_xditview.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XDITVIEW_VERSION = 1.0.1
+XAPP_XDITVIEW_VERSION = 1.0.2
 XAPP_XDITVIEW_SOURCE = xditview-$(XAPP_XDITVIEW_VERSION).tar.bz2
 XAPP_XDITVIEW_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XDITVIEW_DEPENDENCIES = xlib_libXaw
-- 
1.7.9.5

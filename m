From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Oct 2012 14:06:52 +0200
Subject: [Buildroot] [PATCH 2/7] xapp_xbiff: fix build against Xmu by
	bumping version
In-Reply-To: <1350907617-14368-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1350907617-14368-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1350907617-14368-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix a build issue similar to the one encountered on xapp_listres at
http://autobuild.buildroot.org/results/06d0ef38165769df38047c1f64d4cfae835e9e54/.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xbiff/xapp_xbiff.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xapp_xbiff/xapp_xbiff.mk b/package/x11r7/xapp_xbiff/xapp_xbiff.mk
index f954a8d..c6f2d70 100644
--- a/package/x11r7/xapp_xbiff/xapp_xbiff.mk
+++ b/package/x11r7/xapp_xbiff/xapp_xbiff.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XBIFF_VERSION = 1.0.1
+XAPP_XBIFF_VERSION = 1.0.3
 XAPP_XBIFF_SOURCE = xbiff-$(XAPP_XBIFF_VERSION).tar.bz2
 XAPP_XBIFF_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XBIFF_DEPENDENCIES = xlib_libXaw xdata_xbitmaps
-- 
1.7.9.5

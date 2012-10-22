From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Oct 2012 14:06:56 +0200
Subject: [Buildroot] [PATCH 6/7] xapp_xmag: fix build against Xmu by bumping
	version
In-Reply-To: <1350907617-14368-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1350907617-14368-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1350907617-14368-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix a build issue similar to the one encountered on xapp_listres at
http://autobuild.buildroot.org/results/06d0ef38165769df38047c1f64d4cfae835e9e54/.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xmag/xapp_xmag.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xapp_xmag/xapp_xmag.mk b/package/x11r7/xapp_xmag/xapp_xmag.mk
index 235787a..0496c8a 100644
--- a/package/x11r7/xapp_xmag/xapp_xmag.mk
+++ b/package/x11r7/xapp_xmag/xapp_xmag.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XMAG_VERSION = 1.0.2
+XAPP_XMAG_VERSION = 1.0.4
 XAPP_XMAG_SOURCE = xmag-$(XAPP_XMAG_VERSION).tar.bz2
 XAPP_XMAG_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XMAG_DEPENDENCIES = xlib_libXaw
-- 
1.7.9.5

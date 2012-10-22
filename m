From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Oct 2012 14:06:53 +0200
Subject: [Buildroot] [PATCH 3/7] xapp_xedit: fix build against Xmu by
	bumping version
In-Reply-To: <1350907617-14368-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1350907617-14368-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1350907617-14368-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix a build issue similar to the one encountered on xapp_listres at
http://autobuild.buildroot.org/results/06d0ef38165769df38047c1f64d4cfae835e9e54/.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xedit/xapp_xedit.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xapp_xedit/xapp_xedit.mk b/package/x11r7/xapp_xedit/xapp_xedit.mk
index 577bd5a..f69d122 100644
--- a/package/x11r7/xapp_xedit/xapp_xedit.mk
+++ b/package/x11r7/xapp_xedit/xapp_xedit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XEDIT_VERSION = 1.0.2
+XAPP_XEDIT_VERSION = 1.2.0
 XAPP_XEDIT_SOURCE = xedit-$(XAPP_XEDIT_VERSION).tar.bz2
 XAPP_XEDIT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XEDIT_DEPENDENCIES = xlib_libXaw xlib_libXprintUtil
-- 
1.7.9.5

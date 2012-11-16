From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Nov 2012 18:24:00 +0100
Subject: [Buildroot] [PATCH 11/12] xapp_xmh: bump version to 1.0.2 to fix
	Xmu related build failure
In-Reply-To: <cover.1353086601.git.thomas.petazzoni@free-electrons.com>
References: <cover.1353086601.git.thomas.petazzoni@free-electrons.com>
Message-ID: <057d73a8e4934b6aad65573f6bca1e11ee8dfe52.1353086601.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_xmh/xapp_xmh.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xapp_xmh/xapp_xmh.mk b/package/x11r7/xapp_xmh/xapp_xmh.mk
index 463c31d..934f38d 100644
--- a/package/x11r7/xapp_xmh/xapp_xmh.mk
+++ b/package/x11r7/xapp_xmh/xapp_xmh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XMH_VERSION = 1.0.1
+XAPP_XMH_VERSION = 1.0.2
 XAPP_XMH_SOURCE = xmh-$(XAPP_XMH_VERSION).tar.bz2
 XAPP_XMH_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XMH_DEPENDENCIES = xlib_libXaw
-- 
1.7.9.5

From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:21:10 +0200
Subject: [Buildroot] [PATCH 41/69] xapp_xkbcomp: add explicit dependencies
	for host variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-42-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
index fea7fa8e8c45..4fc4372fefa4 100644
--- a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
+++ b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
@@ -10,6 +10,7 @@ XAPP_XKBCOMP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XKBCOMP_LICENSE = MIT
 XAPP_XKBCOMP_LICENSE_FILES = COPYING
 XAPP_XKBCOMP_DEPENDENCIES = xlib_libX11 xlib_libxkbfile
+HOST_XAPP_XKBCOMP_DEPENDENCIES = host-xlib_libX11 host-xlib_libxkbfile
 XAPP_XKBCOMP_CONF_ENV = ac_cv_file___xkbparse_c=yes
 
 $(eval $(autotools-package))
-- 
2.1.0

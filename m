From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:21:07 +0200
Subject: [Buildroot] [PATCH 38/69] xapp_mkfontdir: add explicit dependencies
	for host variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-39-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk b/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
index b74f9939ce6f..f2227bdfdddf 100644
--- a/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
+++ b/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
@@ -10,6 +10,7 @@ XAPP_MKFONTDIR_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_MKFONTDIR_LICENSE = MIT
 XAPP_MKFONTDIR_LICENSE_FILES = COPYING
 XAPP_MKFONTDIR_DEPENDENCIES = xapp_mkfontscale
+HOST_XAPP_MKFONTDIR_DEPENDENCIES = host-xapp_mkfontscale
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.1.0

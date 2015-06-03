From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  3 Jun 2015 22:41:18 +0200
Subject: [Buildroot] [PATCH 01/32 v2] package/matchbox-wm: drop useless
	commented options
In-Reply-To: <cover.1433362840.git.yann.morin.1998@free.fr>
References: <cover.1433362840.git.yann.morin.1998@free.fr>
Message-ID: <53d49202ae8b45e7e41822d2824e79a18827910e.1433362840.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/matchbox/matchbox-wm/matchbox-wm.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/matchbox/matchbox-wm/matchbox-wm.mk b/package/matchbox/matchbox-wm/matchbox-wm.mk
index 16f1417..da9efd7 100644
--- a/package/matchbox/matchbox-wm/matchbox-wm.mk
+++ b/package/matchbox/matchbox-wm/matchbox-wm.mk
@@ -25,10 +25,7 @@ endif
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXFT),y)
-#MATCHBOX_WM_OPTS += --enable-standalone-xft
 MATCHBOX_WM_DEPENDENCIES += xlib_libXft
-else
-#MATCHBOX_WM_OPTS += --disable-standalone-xft
 endif
 
 ifeq ($(BR2_PACKAGE_STARTUP_NOTIFICATION),y)
-- 
1.9.1

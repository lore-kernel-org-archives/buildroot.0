From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue, 16 Oct 2012 08:49:09 +0200
Subject: [Buildroot] [PATCH] fluxbox: select xmodmap
Message-ID: <1350370149-2876-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Fluxbox uses xmodmap in its startup script.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/fluxbox/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/fluxbox/Config.in b/package/fluxbox/Config.in
index e4d6c37..7a3a255 100644
--- a/package/fluxbox/Config.in
+++ b/package/fluxbox/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_FLUXBOX
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XAPP_XMODMAP
 	help
 	  The Fluxbox lightweight window manager for X
 
-- 
1.7.7

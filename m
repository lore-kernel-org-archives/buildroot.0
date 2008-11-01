From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sat, 1 Nov 2008 19:55:22 +0100
Subject: [Buildroot] [PATCH 3/4] qtopia4: don't enable gfx-multiscreen by
	default
Message-ID: <200811011955.22446.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/qtopia4/Config.gfx.in |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/qtopia4/Config.gfx.in b/package/qtopia4/Config.gfx.in
index 572e810..9a1d00b 100644
--- a/package/qtopia4/Config.gfx.in
+++ b/package/qtopia4/Config.gfx.in
@@ -18,6 +18,5 @@ config BR2_PACKAGE_QTOPIA4_GFX_VNC
 
 config BR2_PACKAGE_QTOPIA4_GFX_MULTISCREEN
 	bool "multiscreen"
-	default y
 
 endmenu
-- 
1.6.0.3.536.gb5136

From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Wed,  1 Jul 2015 10:33:57 +0200
Subject: [Buildroot] [PATCH 1/1] wmctrl/Config.in: update site URL
Message-ID: <1435739637-22816-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/wmctrl/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wmctrl/Config.in b/package/wmctrl/Config.in
index e0342b7..bc09431 100644
--- a/package/wmctrl/Config.in
+++ b/package/wmctrl/Config.in
@@ -16,7 +16,7 @@ config BR2_PACKAGE_WMCTRL
 	  always-above or sticky, and to activate, close, move,
 	  resize, maximize and minimize them.
 
-	  http://tomas.styblo.name/wmctrl/
+	  https://sites.google.com/site/tstyblo/wmctrl/
 
 comment "wmctrl needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
-- 
1.9.1

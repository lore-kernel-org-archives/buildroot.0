From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Sat, 10 Oct 2015 09:39:11 +0200
Subject: [Buildroot] [PATCH 1/2] package/Config.in: correct capitalization
	of menu items
Message-ID: <1444462752-4971-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 3794f44..8672ec4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -588,7 +588,7 @@ endif
 	source "package/python/Config.in"
 	source "package/python3/Config.in"
 if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
-menu "external python modules"
+menu "External python modules"
 	source "package/python-alsaaudio/Config.in"
 	source "package/python-bottle/Config.in"
 	source "package/python-can/Config.in"
@@ -680,7 +680,7 @@ endif
 	source "package/ruby/Config.in"
 	source "package/tcl/Config.in"
 if BR2_PACKAGE_TCL
-menu "tcl libraries/modules"
+menu "Tcl libraries/modules"
 	source "package/expect/Config.in"
 	source "package/tcllib/Config.in"
 endmenu
-- 
1.9.1

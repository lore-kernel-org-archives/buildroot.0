From: Carlos Santos <casantos@datacom.com.br>
Date: Fri, 16 Nov 2018 01:16:47 -0200
Subject: [Buildroot] [PATCH] vtun: remove reference to start-stop-daemon
 from package help
Message-ID: <20181116031647.29084-1-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

None of the other 82 packages that use start-stop-daemon does this.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
 package/vtun/Config.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/vtun/Config.in b/package/vtun/Config.in
index bb8919c3d0..d63e7c76ef 100644
--- a/package/vtun/Config.in
+++ b/package/vtun/Config.in
@@ -10,7 +10,4 @@ config BR2_PACKAGE_VTUN
 
 	  It supports IP, PPP, SLIP, Ethernet and other tunnel types.
 
-	  NOTE: It uses start-stop-daemon in init script, so be sure
-	  to enable that within busybox
-
 	  http://vtun.sourceforge.net/
-- 
2.19.1

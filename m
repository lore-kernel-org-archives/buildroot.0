From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 19 Mar 2017 19:22:12 +0200
Subject: [Buildroot] [PATCH] sysvinit: adjust help text
Message-ID: <b1fe55a2d07122056aefda87f502dd1455ec64a2.1489944132.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sysvinit is far from ultimate init implementation these days. Update the
help text to match reality.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/sysvinit/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/sysvinit/Config.in b/package/sysvinit/Config.in
index 94f1612375a1..7f27a70fcc37 100644
--- a/package/sysvinit/Config.in
+++ b/package/sysvinit/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_SYSVINIT
 	depends on BR2_INIT_SYSV
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
-	  /sbin/init - parent of all processes
+	  System V style implementation of /sbin/init, parent of all
+	  processes
 
 	  http://savannah.nongnu.org/projects/sysvinit
-- 
2.11.0

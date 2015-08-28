From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 28 Aug 2015 18:48:33 +0200
Subject: [Buildroot] [PATCH] sysvinit: update website URL
Message-ID: <1440780513-4696-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/sysvinit/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sysvinit/Config.in b/package/sysvinit/Config.in
index d91c643f82fb..2dc3bb07bb59 100644
--- a/package/sysvinit/Config.in
+++ b/package/sysvinit/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_SYSVINIT
 	help
 	  /sbin/init - parent of all processes
 
-	  http://freshmeat.net/projects/sysvinit/
+	  http://savannah.nongnu.org/projects/sysvinit
-- 
1.9.1

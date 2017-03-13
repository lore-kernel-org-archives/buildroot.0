From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 13 Mar 2017 15:53:07 -0300
Subject: [Buildroot] [PATCH] kmscube: update the project URL
Message-ID: <1489431187-24725-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

kmscube repository has been moved to freedesktop.org, so
update the URL accordingly.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 package/kmscube/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kmscube/Config.in b/package/kmscube/Config.in
index 9ab58f9..b9fe627 100644
--- a/package/kmscube/Config.in
+++ b/package/kmscube/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_KMSCUBE
 	help
 	  kmscube is an application to test kms/drm drivers.
 
-	  https://github.com/robclark/kmscube/
+	  https://cgit.freedesktop.org/mesa/kmscube/
-- 
2.7.4

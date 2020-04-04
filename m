From: Fabio Estevam <festevam@gmail.com>
Date: Sat,  4 Apr 2020 10:57:50 -0300
Subject: [Buildroot] [PATCH] package/kmscube: Use the official gitlab URL
Message-ID: <20200404135750.29434-1-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The cgit URL is a mirror of the gitlab repository.

The README.md file of the kmscube project also points
to the gitlab repository, so switch the URL accordingly.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 package/kmscube/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kmscube/Config.in b/package/kmscube/Config.in
index b9fe627c87..b6ad305bfb 100644
--- a/package/kmscube/Config.in
+++ b/package/kmscube/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_KMSCUBE
 	help
 	  kmscube is an application to test kms/drm drivers.
 
-	  https://cgit.freedesktop.org/mesa/kmscube/
+	  https://gitlab.freedesktop.org/mesa/kmscube
-- 
2.17.1

From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 17 Mar 2015 23:28:47 +0100
Subject: [Buildroot] [PATCH] package/dvdrw-tools: fix incorrect default
	choiche
Message-ID: <1426631327-15489-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This pathc fixes default choiche BR2_PACKAGE_DVDRW_TOOLS_CDRKIT_BACKEND.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/dvdrw-tools/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dvdrw-tools/Config.in b/package/dvdrw-tools/Config.in
index 6787b66..fb4d4c2 100644
--- a/package/dvdrw-tools/Config.in
+++ b/package/dvdrw-tools/Config.in
@@ -35,7 +35,7 @@ config BR2_PACKAGE_DVDRW_TOOLS
 if BR2_PACKAGE_DVDRW_TOOLS
 choice
 	prompt "Media Backend"
-	default BR2_PACKAGE_DVDRW_CDRKIT_BACKEND
+	default BR2_PACKAGE_DVDRW_TOOLS_CDRKIT_BACKEND
 	help
 	  Choose which media backend program to use.
 
-- 
1.9.1

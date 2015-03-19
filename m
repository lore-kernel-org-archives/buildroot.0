From: Steve Kenton <skenton@ou.edu>
Date: Thu, 19 Mar 2015 11:24:36 -0500
Subject: [Buildroot] [PATCH v1 1/1] dvdrw-tools: delete explicit default for
	backend
Message-ID: <1426782276-5069-1-git-send-email-skenton@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Steve Kenton <skenton@ou.edu>
---
As suggested by Yann E. MORIN, just delete the default choice
to simplify things

 package/dvdrw-tools/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/dvdrw-tools/Config.in b/package/dvdrw-tools/Config.in
index 6787b66..47835d8 100644
--- a/package/dvdrw-tools/Config.in
+++ b/package/dvdrw-tools/Config.in
@@ -35,7 +35,6 @@ config BR2_PACKAGE_DVDRW_TOOLS
 if BR2_PACKAGE_DVDRW_TOOLS
 choice
 	prompt "Media Backend"
-	default BR2_PACKAGE_DVDRW_CDRKIT_BACKEND
 	help
 	  Choose which media backend program to use.
 
-- 
2.1.0

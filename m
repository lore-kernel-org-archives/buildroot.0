From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 10 Jul 2014 16:57:44 -0300
Subject: [Buildroot] [PATCH] gd: switch to new homepage
Message-ID: <1405022264-25251-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gd/Config.in b/package/gd/Config.in
index ba6f326..e838635 100644
--- a/package/gd/Config.in
+++ b/package/gd/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_GD
 	  useful in World Wide Web applications, where PNG is one of
 	  the formats accepted for inline images by most browsers.
 
-	  http://www.boutell.com/gd/
+	  http://libgd.bitbucket.org/
 
 if BR2_PACKAGE_GD
 
-- 
1.8.5.5

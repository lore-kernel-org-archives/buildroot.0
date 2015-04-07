From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  7 Apr 2015 20:34:29 -0300
Subject: [Buildroot] [PATCH] adwaita-icon-theme: also available for libgtk2
Message-ID: <1428449669-8756-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It can actually be used for libgtk2 as well as libgtk3.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/adwaita-icon-theme/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/adwaita-icon-theme/Config.in b/package/adwaita-icon-theme/Config.in
index a06071e..d200570 100644
--- a/package/adwaita-icon-theme/Config.in
+++ b/package/adwaita-icon-theme/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_ADWAITA_ICON_THEME
 	bool "adwaita icon theme"
-	depends on BR2_PACKAGE_LIBGTK3
+	depends on BR2_PACKAGE_LIBGTK2 || BR2_PACKAGE_LIBGTK3
 	help
 	  Adwaita icon theme
-- 
2.0.5

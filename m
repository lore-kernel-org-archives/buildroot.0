From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 11 Apr 2015 07:51:13 -0300
Subject: [Buildroot] [PATCH 1/3] package: fix fonts & co alpha sort
Message-ID: <1428749475-898-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fonts & co go before Games.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 9486ec2..f791f5b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -176,18 +176,6 @@ menu "Filesystem and flash utilities"
 	source "package/xfsprogs/Config.in"
 endmenu
 
-menu "Games"
-	source "package/doom-wad/Config.in"
-	source "package/gnuchess/Config.in"
-	source "package/lbreakout2/Config.in"
-	source "package/ltris/Config.in"
-	source "package/opentyrian/Config.in"
-	source "package/opentyrian-data/Config.in"
-	source "package/prboom/Config.in"
-	source "package/rubix/Config.in"
-	source "package/sl/Config.in"
-endmenu
-
 menu "Fonts, icons, sounds and themes"
 
 comment "Fonts"
@@ -208,6 +196,18 @@ comment "Themes"
 
 endmenu
 
+menu "Games"
+	source "package/doom-wad/Config.in"
+	source "package/gnuchess/Config.in"
+	source "package/lbreakout2/Config.in"
+	source "package/ltris/Config.in"
+	source "package/opentyrian/Config.in"
+	source "package/opentyrian-data/Config.in"
+	source "package/prboom/Config.in"
+	source "package/rubix/Config.in"
+	source "package/sl/Config.in"
+endmenu
+
 menu "Graphic libraries and applications (graphic/text)"
 
 comment "Graphic applications"
-- 
2.0.5

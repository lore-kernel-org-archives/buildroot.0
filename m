From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Sat, 13 Dec 2014 09:18:00 +0100
Subject: [Buildroot] [PATCH 1/2] package/Config.in: fix menu alphabetical
	order
Message-ID: <1418458681-5342-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/Config.in |   22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 48be2df..7300443 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -961,6 +961,17 @@ endmenu
 
 endmenu
 
+menu "Mail"
+	source "package/dovecot/Config.in"
+	source "package/exim/Config.in"
+	source "package/fetchmail/Config.in"
+	source "package/heirloom-mailx/Config.in"
+	source "package/libesmtp/Config.in"
+	source "package/msmtp/Config.in"
+	source "package/mutt/Config.in"
+	source "package/sylpheed/Config.in"
+endmenu
+
 menu "Miscellaneous"
 	source "package/aespipe/Config.in"
 	source "package/bc/Config.in"
@@ -978,17 +989,6 @@ menu "Miscellaneous"
 	source "package/sound-theme-freedesktop/Config.in"
 endmenu
 
-menu "Mail"
-	source "package/dovecot/Config.in"
-	source "package/exim/Config.in"
-	source "package/fetchmail/Config.in"
-	source "package/heirloom-mailx/Config.in"
-	source "package/libesmtp/Config.in"
-	source "package/msmtp/Config.in"
-	source "package/mutt/Config.in"
-	source "package/sylpheed/Config.in"
-endmenu
-
 menu "Networking applications"
 	source "package/aiccu/Config.in"
 	source "package/aircrack-ng/Config.in"
-- 
1.7.9.5

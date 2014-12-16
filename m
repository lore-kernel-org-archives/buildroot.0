From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Dec 2014 23:45:52 +0100
Subject: [Buildroot] [git commit] package/Config.in: fix menu alphabetical
	order
Message-ID: <20141216225030.2157880455@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b90f1934c09272bfa019c398e3d928a055ceaa16
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in |   22 +++++++++++-----------
 1 files changed, 11 insertions(+), 11 deletions(-)

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

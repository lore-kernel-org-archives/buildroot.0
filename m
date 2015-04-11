From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Apr 2015 15:16:49 +0200
Subject: [Buildroot] [git commit] package: fix fonts & co alpha sort
Message-ID: <20150411131659.213F980795@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0dd3a94fe3246ef25999881502fb0bad912082ad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fonts & co go before Games.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in |   24 ++++++++++++------------
 1 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index de8e856..a996855 100644
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

From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Mar 2014 21:15:42 +0100
Subject: [Buildroot] [git commit] Create new section "Mail" in menuconfig
	and collect mail packages
Message-ID: <20140315202727.9492F9BFE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ff9c160ce71917dee0124fd9ba9726c70162ed1c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in |   13 ++++++++-----
 1 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 70e5a7f..70d7023 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -230,7 +230,6 @@ source "package/leafpad/Config.in"
 source "package/midori/Config.in"
 source "package/pcmanfm/Config.in"
 source "package/rdesktop/Config.in"
-source "package/sylpheed/Config.in"
 source "package/synergy/Config.in"
 source "package/torsmo/Config.in"
 source "package/wmctrl/Config.in"
@@ -696,7 +695,6 @@ source "package/libcgi/Config.in"
 source "package/libcgicc/Config.in"
 source "package/libcurl/Config.in"
 source "package/libdnet/Config.in"
-source "package/libesmtp/Config.in"
 source "package/libeXosip2/Config.in"
 source "package/libfcgi/Config.in"
 source "package/libgsasl/Config.in"
@@ -842,6 +840,14 @@ source "package/sound-theme-borealis/Config.in"
 source "package/sound-theme-freedesktop/Config.in"
 endmenu
 
+menu "Mail"
+source "package/heirloom-mailx/Config.in"
+source "package/libesmtp/Config.in"
+source "package/msmtp/Config.in"
+source "package/mutt/Config.in"
+source "package/sylpheed/Config.in"
+endmenu
+
 menu "Networking applications"
 source "package/aiccu/Config.in"
 source "package/aircrack-ng/Config.in"
@@ -878,7 +884,6 @@ source "package/foomatic-filters/Config.in"
 source "package/fping/Config.in"
 source "package/gesftpserver/Config.in"
 source "package/gutenprint/Config.in"
-source "package/heirloom-mailx/Config.in"
 source "package/hiawatha/Config.in"
 source "package/hostapd/Config.in"
 source "package/hplip/Config.in"
@@ -912,9 +917,7 @@ source "package/modem-manager/Config.in"
 source "package/mongoose/Config.in"
 source "package/mongrel2/Config.in"
 source "package/mrouted/Config.in"
-source "package/msmtp/Config.in"
 source "package/mtr/Config.in"
-source "package/mutt/Config.in"
 source "package/nbd/Config.in"
 source "package/ncftp/Config.in"
 source "package/ndisc6/Config.in"

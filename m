From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun,  6 Apr 2014 00:22:38 +0200
Subject: [Buildroot] [PATCH] exim: move to "Mail" menu
Message-ID: <1396736558-4646-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index 9d8b31f..cc28d51 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -857,6 +857,7 @@ source "package/sound-theme-freedesktop/Config.in"
 endmenu
 
 menu "Mail"
+source "package/exim/Config.in"
 source "package/fetchmail/Config.in"
 source "package/heirloom-mailx/Config.in"
 source "package/libesmtp/Config.in"
@@ -897,7 +898,6 @@ source "package/dnsmasq/Config.in"
 source "package/dropbear/Config.in"
 source "package/ebtables/Config.in"
 source "package/ethtool/Config.in"
-source "package/exim/Config.in"
 source "package/foomatic-filters/Config.in"
 source "package/fping/Config.in"
 source "package/gesftpserver/Config.in"
-- 
1.8.3.2

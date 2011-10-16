From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 16 Oct 2011 00:04:29 -0300
Subject: [Buildroot] [PATCH 3/7] package/Config.in: more sort fixes for
	network apps
In-Reply-To: <1318734273-24454-1-git-send-email-gustavo@zacarias.com.ar>
References: <1318734273-24454-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1318734273-24454-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Send xl2tp to the bottom of the network applications menu to respect
sort order.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 86b0406..524f4c7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -420,7 +420,6 @@ source "package/ipset/Config.in"
 source "package/iptables/Config.in"
 source "package/iw/Config.in"
 source "package/kismet/Config.in"
-source "package/xl2tp/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/lighttpd/Config.in"
 endif
@@ -483,6 +482,7 @@ source "package/wget/Config.in"
 endif
 source "package/wireless_tools/Config.in"
 source "package/wpa_supplicant/Config.in"
+source "package/xl2tp/Config.in"
 
 endmenu
 
-- 
1.7.3.4

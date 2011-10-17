From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 17 Oct 2011 23:28:09 +0200
Subject: [Buildroot] [git commit] package/Config.in: more sort fixes for
	network apps
Message-ID: <20111018052252.0A0BD8D1BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=78a8ff844bd9c2fda3af9d6233977a3201e5831d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Send xl2tp to the bottom of the network applications menu to respect
sort order.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 5d4fde2..3b2769d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -427,7 +427,6 @@ source "package/ipset/Config.in"
 source "package/iptables/Config.in"
 source "package/iw/Config.in"
 source "package/kismet/Config.in"
-source "package/xl2tp/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/lighttpd/Config.in"
 endif
@@ -490,6 +489,7 @@ source "package/wget/Config.in"
 endif
 source "package/wireless_tools/Config.in"
 source "package/wpa_supplicant/Config.in"
+source "package/xl2tp/Config.in"
 
 endmenu
 

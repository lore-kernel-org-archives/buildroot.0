From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Wed, 11 Dec 2013 09:25:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/Config.in: fix alphabetical order
Message-ID: <1386750308-6918-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/Config.in |   14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 40c9e31..eb96aeb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -177,9 +177,9 @@ source "package/fbgrab/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/fbset/Config.in"
 endif
+source "package/fb-test-app/Config.in"
 source "package/fbterm/Config.in"
 source "package/fbv/Config.in"
-source "package/fb-test-app/Config.in"
 source "package/imagemagick/Config.in"
 source "package/linux-fusion/Config.in"
 source "package/lite/Config.in"
@@ -208,8 +208,8 @@ source "package/qwt/Config.in"
 endif
 
 source "package/qt5/Config.in"
-source "package/x11r7/Config.in"
 source "package/weston/Config.in"
+source "package/x11r7/Config.in"
 
 comment "X applications"
 source "package/alsamixergui/Config.in"
@@ -338,13 +338,13 @@ source "package/usb_modeswitch/Config.in"
 source "package/usb_modeswitch_data/Config.in"
 source "package/usbmount/Config.in"
 source "package/usbutils/Config.in"
-source "package/wipe/Config.in"
 source "package/w_scan/Config.in"
+source "package/wipe/Config.in"
 endmenu
 
 menu "Interpreter languages and scripting"
-source "package/erlang/Config.in"
 source "package/enscript/Config.in"
+source "package/erlang/Config.in"
 source "package/haserl/Config.in"
 source "package/jamvm/Config.in"
 source "package/jimtcl/Config.in"
@@ -356,6 +356,8 @@ source "package/cgilua/Config.in"
 source "package/copas/Config.in"
 source "package/coxpcall/Config.in"
 source "package/lbase64/Config.in"
+source "package/lua-ev/Config.in"
+source "package/lua-msgpack-native/Config.in"
 source "package/luabitop/Config.in"
 source "package/luacjson/Config.in"
 source "package/luacrypto/Config.in"
@@ -366,8 +368,6 @@ source "package/luaposix/Config.in"
 source "package/luasec/Config.in"
 source "package/luasocket/Config.in"
 source "package/luasql/Config.in"
-source "package/lua-ev/Config.in"
-source "package/lua-msgpack-native/Config.in"
 source "package/orbit/Config.in"
 source "package/rings/Config.in"
 source "package/wsapi/Config.in"
@@ -619,8 +619,8 @@ source "package/cppzmq/Config.in"
 source "package/czmq/Config.in"
 source "package/filemq/Config.in"
 source "package/glib-networking/Config.in"
-source "package/libcgicc/Config.in"
 source "package/libcgi/Config.in"
+source "package/libcgicc/Config.in"
 source "package/libcurl/Config.in"
 source "package/libdnet/Config.in"
 source "package/libesmtp/Config.in"
-- 
1.7.9.5

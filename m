From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Oct 2013 11:18:32 +0100
Subject: [Buildroot] [git commit] packages/Config.in: Change entries titles
Message-ID: <20131027101944.8C5C69BB98@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3b68e8735ecb4099bbb6fc90da0fdf8f4d6217d0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch mostly fix the casing on different entries titles.
It also changes the name of "Misc devices firmwares" to a simpler
"Firmware".

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index e40fa31..32be4d9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -169,7 +169,7 @@ source "package/gnuplot/Config.in"
 source "package/jhead/Config.in"
 source "package/rrdtool/Config.in"
 
-comment "graphic libraries"
+comment "Graphic libraries"
 source "package/cegui06/Config.in"
 source "package/directfb/Config.in"
 source "package/directfb-examples/Config.in"
@@ -196,7 +196,7 @@ source "package/sdl_net/Config.in"
 source "package/sdl_sound/Config.in"
 source "package/sdl_ttf/Config.in"
 
-comment "other GUIs"
+comment "Other GUIs"
 source "package/efl/Config.in"
 source "package/qt/Config.in"
 
@@ -240,7 +240,7 @@ source "package/liberation/Config.in"
 source "package/libsexy/Config.in"
 source "package/x11r7/xkeyboard-config/Config.in"
 
-comment "X Window managers"
+comment "X window managers"
 source "package/blackbox/Config.in"
 source "package/enlightenment/Config.in"
 source "package/fluxbox/Config.in"
@@ -249,7 +249,7 @@ source "package/metacity/Config.in"
 endmenu
 
 menu "Hardware handling"
-menu "Misc devices firmwares"
+menu "Firmware"
 source "package/am33x-cm3/Config.in"
 source "package/b43-firmware/Config.in"
 source "package/linux-firmware/Config.in"

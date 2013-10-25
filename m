From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri, 25 Oct 2013 11:12:44 +0200
Subject: [Buildroot] [PATCH v2 2/2] packages/Config.in: Change entries titles
In-Reply-To: <1382692364-25912-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1382692364-25912-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1382692364-25912-2-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch mostly fix the casing on different entries titles.
It also changes the name of "Misc devices firmwares" to a simpler
"Firmware".

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
Changes v2 -> v3:
  - Add the rename of Misc devices firmwares to Firmware (suggested by
    Thomas De Schampheleire)
Changes v1 -> v2:
  - Fix Other GUIs casing (suggested by Thomas De Schampheleire)

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 7147a0f..150619d 100644
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
 
@@ -241,7 +241,7 @@ source "package/liberation/Config.in"
 source "package/libsexy/Config.in"
 source "package/x11r7/xkeyboard-config/Config.in"
 
-comment "X Window managers"
+comment "X window managers"
 source "package/blackbox/Config.in"
 source "package/enlightenment/Config.in"
 source "package/fluxbox/Config.in"
@@ -249,7 +249,7 @@ source "package/matchbox/Config.in"
 source "package/metacity/Config.in"
 
 menu "Hardware handling"
-menu "Misc devices firmwares"
+menu "Firmware"
 source "package/am33x-cm3/Config.in"
 source "package/b43-firmware/Config.in"
 source "package/linux-firmware/Config.in"
-- 
1.8.4.rc3

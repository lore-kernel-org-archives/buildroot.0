From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Fri,  8 Dec 2017 08:28:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/Config.in: fix alphabetical order
Message-ID: <1512718110-5284-1-git-send-email-jerzy.m.grzegorek@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
---
 package/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index 40e368b..e51b69e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -359,6 +359,7 @@ endmenu
 menu "Hardware handling"
 menu "Firmware"
 	source "package/am33x-cm3/Config.in"
+	source "package/armbian-firmware/Config.in"
 	source "package/b43-firmware/Config.in"
 	source "package/linux-firmware/Config.in"
 	source "package/rpi-bt-firmware/Config.in"
@@ -370,7 +371,6 @@ menu "Firmware"
 	source "package/wilc1000-firmware/Config.in"
 	source "package/wilink-bt-firmware/Config.in"
 	source "package/zd1211-firmware/Config.in"
-	source "package/armbian-firmware/Config.in"
 endmenu
 	source "package/a10disp/Config.in"
 	source "package/acpica/Config.in"
-- 
1.9.1

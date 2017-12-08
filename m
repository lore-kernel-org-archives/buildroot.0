From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Dec 2017 14:32:53 +0100
Subject: [Buildroot] [git commit] package/Config.in: fix alphabetical order
Message-ID: <20171208133432.B7462815DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2c58adaa5bc769f37a2a90b90aa4627ce7ab56eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index 9c9a4a7..74e47f2 100644
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

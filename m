From: Jeremy Kerr <jk@ozlabs.org>
Date: Thu, 16 Jan 2014 14:27:51 +0800
Subject: [Buildroot] [PATCH 1/3] package/linux-firmware: Fix "firmwares"
	plural
In-Reply-To: <1389853671.877776.456824160566.0.gpush@pablo>
Message-ID: <1389853671.878178.691419279550.1.gpush@pablo>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Minor nit: Like "hardware", "software" and "sheep", the plural of
"firmware" is "firmware".

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

---
 package/linux-firmware/Config.in |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index ab7c0712..c8d7a55a 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_LINUX_FIRMWARE
 
 if BR2_PACKAGE_LINUX_FIRMWARE
 
-menu "WiFi firmwares"
+menu "WiFi firmware"
 
 config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_7010
 	bool "Atheros 7010"
@@ -93,7 +93,7 @@ config BR2_PACKAGE_LINUX_FIRMWARE_TI_WL128X
 
 endmenu
 
-menu "DVB firmwares"
+menu "DVB firmware"
 
 config BR2_PACKAGE_LINUX_FIRMWARE_DIB0700
 	bool "DiBcom dib0700"

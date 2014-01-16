From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jan 2014 09:05:35 +0100
Subject: [Buildroot] [git commit] package/linux-firmware: Fix "firmwares"
	plural
Message-ID: <20140116081738.556C39C4F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8ac836c5324850eccfe079e4788ef6bf3fa4c76c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Minor nit: Like "hardware", "software" and "sheep", the plural of
"firmware" is "firmware".

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-firmware/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index ab7c071..c8d7a55 100644
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

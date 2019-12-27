From: Mark Corbin <mark@dibsco.co.uk>
Date: Fri, 27 Dec 2019 14:58:28 +0000
Subject: [Buildroot] [PATCH 1/1] package/zd1211-firmware: add an upstream
 URL to Config.in
Message-ID: <20191227145828.5826-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
---
 package/zd1211-firmware/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/zd1211-firmware/Config.in b/package/zd1211-firmware/Config.in
index 4469533b0a..807c26f536 100644
--- a/package/zd1211-firmware/Config.in
+++ b/package/zd1211-firmware/Config.in
@@ -2,3 +2,5 @@ config BR2_PACKAGE_ZD1211_FIRMWARE
 	bool "zd1211-firmware"
 	help
 	  Firmware for the ZyDAS ZD1211 / Atheros AR5007UG wifi devices.
+
+	  https://sourceforge.net/projects/zd1211/
-- 
2.20.1

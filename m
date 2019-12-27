From: Mark Corbin <mark@dibsco.co.uk>
Date: Fri, 27 Dec 2019 15:35:34 +0000
Subject: [Buildroot] [PATCH 1/1] boot/uboot: add an upstream URL to Config.in
Message-ID: <20191227153534.8266-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an upstream URL to the help text in Config.in. This
addresses the issue where an incorrect URL is displayed
on the package stats web page.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
---
 boot/uboot/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 15cae8045a..42f2090787 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -3,6 +3,8 @@ config BR2_TARGET_UBOOT
 	help
 	  Build "Das U-Boot" Boot Monitor
 
+	  https://www.denx.de/wiki/U-Boot
+
 if BR2_TARGET_UBOOT
 choice
 	prompt "Build system"
-- 
2.20.1

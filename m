From: Julien Corjon <corjon.j@ecagroup.com>
Date: Mon, 29 Jan 2018 09:28:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/wf111: Fix manufacturer name and url
Message-ID: <20180129082819.13870-1-corjon.j@ecagroup.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
---
 package/wf111/Config.in | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wf111/Config.in b/package/wf111/Config.in
index 80109f1b88..081bd960cb 100644
--- a/package/wf111/Config.in
+++ b/package/wf111/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_WF111
 	# dynamically linked against the glibc.
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	help
-	  BlueGiga WF111 WiFi driver and utilities.
+	  Silicon Labs WF111 WiFi driver and utilities.
 
 	  Warning: CONFIG_WIRELESS_EXT and CONFIG_WEXT_PRIV must be
 	  selected in the Linux kernel configuration. These are blind
@@ -17,16 +17,16 @@ config BR2_PACKAGE_WF111
 	    configuration entry that selects them, for example.
 	  - By enabling another random WiFi driver that select them.
 
-	  http://www.bluegiga.com/en-US/products/wifi-modules/wf111-wifi-module/
+	  https://www.silabs.com/products/wireless/wi-fi/wf111-bluegiga-module
 
 if BR2_PACKAGE_WF111
 
 config BR2_PACKAGE_WF111_TARBALL_PATH
 	string "Local tarball location"
 	help
-	  The WF111 tarball can be retrieved on the BlueGiga website
-	  after registration. This option specifies the path where the
-	  tarball is locally saved.
+	  The WF111 tarball can be retrieved on the Silicon Labs
+	  website after registration. This option specifies the path
+	  where the tarball is locally saved.
 
 endif
 
-- 
2.14.1

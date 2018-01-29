From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Jan 2018 14:39:37 +0100
Subject: [Buildroot] [git commit] package/wf111: Fix manufacturer name and
 url
Message-ID: <20180129134202.9593287F7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd431297e384f11a2ec285c4ec14a49a7f89fe3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 

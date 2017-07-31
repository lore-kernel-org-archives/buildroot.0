From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 31 Jul 2017 09:53:44 -0400
Subject: [Buildroot] [PATCH 4/9] fix help text wrapping for configs h
In-Reply-To: <20170731135350.9018-1-aduskett@gmail.com>
References: <20170731135350.9018-1-aduskett@gmail.com>
Message-ID: <20170731135350.9018-4-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The check-package script when ran gives warnings on text wrapping
on all of these Config files.  This patch cleans up all warnings
related to the text wrapping for the Config files starting with
the letter h in the package directory.

The appropriate indentation is: <tab><2 spaces><62 chars>
See http://nightly.buildroot.org/#writing-rules-config-in for more
information.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/hans/Config.in               |  7 ++++---
 package/hicolor-icon-theme/Config.in |  3 ++-
 package/hplip/Config.in              | 11 ++++++-----
 package/httping/Config.in            |  9 +++++----
 package/hwdata/Config.in             |  5 +++--
 5 files changed, 20 insertions(+), 15 deletions(-)

diff --git a/package/hans/Config.in b/package/hans/Config.in
index 7b60090f6..54bdfd96d 100644
--- a/package/hans/Config.in
+++ b/package/hans/Config.in
@@ -5,9 +5,10 @@ config BR2_PACKAGE_HANS
 	bool "hans"
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
-	  Hans makes it possible to tunnel IPv4 through ICMP echo packets,
-	  so you could call it a ping tunnel.
+	  Hans makes it possible to tunnel IPv4 through ICMP echo
+	  packets, so you could call it a ping tunnel.
 	  This can be useful when you find yourself in the situation
-	  that your Internet access is firewalled, but pings are allowed.
+	  that your Internet access is firewalled, but pings are
+	  allowed.
 
 	  http://code.gerade.org/hans/
diff --git a/package/hicolor-icon-theme/Config.in b/package/hicolor-icon-theme/Config.in
index 6cda097c1..10edbf886 100644
--- a/package/hicolor-icon-theme/Config.in
+++ b/package/hicolor-icon-theme/Config.in
@@ -5,4 +5,5 @@ config BR2_PACKAGE_HICOLOR_ICON_THEME
 
 	  This is the fallback icon theme, which only creates the
 	  standard directory structure for storing icons of third-party
-	  applications (i.e. the ones not available in usual icon themes).
+	  applications (i.e. the ones not available in usual icon
+	  themes).
diff --git a/package/hplip/Config.in b/package/hplip/Config.in
index 176dc6a6a..f4e0fe753 100644
--- a/package/hplip/Config.in
+++ b/package/hplip/Config.in
@@ -8,11 +8,12 @@ config BR2_PACKAGE_HPLIP
 	select BR2_PACKAGE_JPEG
 	help
 	  HP Linux Imaging and Printing (HPLIP)
-	  HPLIP is an HP-developed solution for printing, scanning, and faxing
-	  with HP inkjet and laser based printers in Linux. The HPLIP project
-	  provides printing support for 2,211 printer models, including
-	  Deskjet, Officejet, Photosmart, PSC (Print Scan Copy), Business
-	  Inkjet, LaserJet, Edgeline MFP, and LaserJet MFP.
+	  HPLIP is an HP-developed solution for printing, scanning, and
+	  faxing with HP inkjet and laser based printers in Linux. The
+	  HPLIP project provides printing support for 2,211 printer
+	  models, including Deskjet, Officejet, Photosmart, PSC
+	  (Print Scan Copy), Business Inkjet, LaserJet, Edgeline MFP,
+	  and LaserJet MFP.
 
 	  http://hplipopensource.com/
 
diff --git a/package/httping/Config.in b/package/httping/Config.in
index 07ff10208..c0e5071ce 100644
--- a/package/httping/Config.in
+++ b/package/httping/Config.in
@@ -6,10 +6,11 @@ config BR2_PACKAGE_HTTPING
 	depends on BR2_USE_WCHAR
 	help
 	  Httping is like 'ping' but for http-requests.
-	  Give it an url, and it'll show you how long it takes to connect,
-	  send a request and retrieve the reply (only the headers).
-	  Be aware that the transmission across the network also takes time!
-	  So it measures the latency of the webserver + network.
+	  Give it an url, and it'll show you how long it takes to
+	  connect, send a request and retrieve the reply (only the
+	  headers).
+	  Be aware that the transmission across the network also takes
+	  time! So it measures the latency of the webserver + network.
 
 	  http://www.vanheusden.com/httping/
 
diff --git a/package/hwdata/Config.in b/package/hwdata/Config.in
index 33e0738af..8424238e1 100644
--- a/package/hwdata/Config.in
+++ b/package/hwdata/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_HWDATA
 	bool "hwdata"
 	help
-	  Various hardware identification and configuration data, such as
-	  the pci.ids database, or the XFree86/xorg Cards database.
+	  Various hardware identification and configuration data,
+	  such as the pci.ids database, or the XFree86/xorg Cards
+	  database.
-- 
2.13.3

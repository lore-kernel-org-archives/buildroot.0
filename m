From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 2 Oct 2014 22:43:53 +0200
Subject: [Buildroot] [git commit] package: indentation cleanup
Message-ID: <20141002204627.074FE9D7E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e7d8e346fd779bf75ff50b2b04677a6dc18ccea5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dillo/Config.in             |    4 ++--
 package/espeak/Config.in            |    2 +-
 package/ftop/Config.in              |    2 +-
 package/inadyn/Config.in            |    2 +-
 package/libstrophe/Config.in        |    2 +-
 package/mpd/Config.in               |    2 +-
 package/opencore-amr/Config.in      |    2 +-
 package/openvmtools/Config.in       |    2 +-
 package/phidgetwebservice/Config.in |    2 +-
 package/php/Config.in               |    2 +-
 package/twolame/Config.in           |    2 +-
 package/wpa_supplicant/Config.in    |    2 +-
 12 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/package/dillo/Config.in b/package/dillo/Config.in
index bd317ff..8d3cbb1 100644
--- a/package/dillo/Config.in
+++ b/package/dillo/Config.in
@@ -13,5 +13,5 @@ config BR2_PACKAGE_DILLO
 	  http://www.dillo.org
 
 comment "dillo needs a toolchain w/ C++"
-        depends on BR2_PACKAGE_XORG7 && BR2_USE_MMU
-        depends on !BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_XORG7 && BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/espeak/Config.in b/package/espeak/Config.in
index 4fd7845..29dfec9 100644
--- a/package/espeak/Config.in
+++ b/package/espeak/Config.in
@@ -21,7 +21,7 @@ choice
 	default BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_NONE
 
 config BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_NONE
-       bool "No sound backend, only produce wav files"
+	bool "No sound backend, only produce wav files"
 
 config BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_ALSA
 	bool "alsa via portaudio"
diff --git a/package/ftop/Config.in b/package/ftop/Config.in
index 878574f..d8f57b0 100644
--- a/package/ftop/Config.in
+++ b/package/ftop/Config.in
@@ -9,4 +9,4 @@ config BR2_PACKAGE_FTOP
 	  https://code.google.com/p/ftop/
 
 comment "ftop needs a toolchain w/ largefile"
-        depends on !BR2_LARGEFILE
+	depends on !BR2_LARGEFILE
diff --git a/package/inadyn/Config.in b/package/inadyn/Config.in
index c1f7a77..2809531 100644
--- a/package/inadyn/Config.in
+++ b/package/inadyn/Config.in
@@ -10,5 +10,5 @@ config BR2_PACKAGE_INADYN
 	  https://github.com/troglobit/inadyn
 
 comment "inadyn needs a toolchain w/ dynamic library"
-        depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_PREFER_STATIC_LIB
 	depends on BR2_USE_MMU
diff --git a/package/libstrophe/Config.in b/package/libstrophe/Config.in
index ff80532..55dc162 100644
--- a/package/libstrophe/Config.in
+++ b/package/libstrophe/Config.in
@@ -12,4 +12,4 @@ config BR2_PACKAGE_LIBSTROPHE
 	  https://github.com/strophe/libstrophe
 
 comment "libstrophe needs a toolchain w/ threads"
-        depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 108b2b1..8884464 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -188,7 +188,7 @@ config BR2_PACKAGE_MPD_TWOLAME
 	  Enable TwoLAME mp2 encoding.
 
 comment "twolame support needs a toolchain w/ largefile"
-        depends on !BR2_LARGEFILE
+	depends on !BR2_LARGEFILE
 
 config BR2_PACKAGE_MPD_VORBIS
 	bool "vorbis"
diff --git a/package/opencore-amr/Config.in b/package/opencore-amr/Config.in
index 93b6457..1ccc631 100644
--- a/package/opencore-amr/Config.in
+++ b/package/opencore-amr/Config.in
@@ -8,4 +8,4 @@ config BR2_PACKAGE_OPENCORE_AMR
 	  http://opencore-amr.sourceforge.net/
 
 comment "opencore-amr needs a toolchain w/ C++"
-        depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/openvmtools/Config.in b/package/openvmtools/Config.in
index 319b653..b0bdd52 100644
--- a/package/openvmtools/Config.in
+++ b/package/openvmtools/Config.in
@@ -16,7 +16,7 @@ config BR2_PACKAGE_OPENVMTOOLS
 	  ICU locales and X11 tools are currently not supported.
 
 	  NOTE: Support for vmblock-fuse will be enabled in openvmtools if the
-	        libfuse package is selected.
+		libfuse package is selected.
 
 if BR2_PACKAGE_OPENVMTOOLS
 
diff --git a/package/phidgetwebservice/Config.in b/package/phidgetwebservice/Config.in
index b85166e..df41d2a 100644
--- a/package/phidgetwebservice/Config.in
+++ b/package/phidgetwebservice/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_PHIDGETWEBSERVICE
 	depends on !BR2_PREFER_STATIC_LIB # libphidget
 	select BR2_PACKAGE_LIBPHIDGET
 	help
-          phidgetwebservice (the Phidget WebService) provides an HTTP
+	  phidgetwebservice (the Phidget WebService) provides an HTTP
 	  front-end to the libphidget device control API. This provides
 	  an alternative to the libphidget C linkage interface for
 	  controlling locally attached Phidgets USB devices and it also
diff --git a/package/php/Config.in b/package/php/Config.in
index 4ee14c3..32faa32 100644
--- a/package/php/Config.in
+++ b/package/php/Config.in
@@ -18,7 +18,7 @@ config BR2_PACKAGE_PHP_CGI
 	bool
 
 config BR2_PACKAGE_PHP_FPM
-        bool
+	bool
 
 choice
 	prompt "Interface"
diff --git a/package/twolame/Config.in b/package/twolame/Config.in
index bd151e2..93cfe0b 100644
--- a/package/twolame/Config.in
+++ b/package/twolame/Config.in
@@ -10,4 +10,4 @@ config BR2_PACKAGE_TWOLAME
 	  http://www.twolame.org/
 
 comment "twolame needs a toolchain w/ largefile"
-        depends on !BR2_LARGEFILE
+	depends on !BR2_LARGEFILE
diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index 81c61ac..6b1c492 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -28,7 +28,7 @@ config BR2_PACKAGE_WPA_SUPPLICANT_HOTSPOT
 	  Enable Hotspot 2.0 and IEEE 802.11u interworking functionality.
 
 config BR2_PACKAGE_WPA_SUPPLICANT_DEBUG_SYSLOG
-        bool "Enable syslog support"
+	bool "Enable syslog support"
 	help
 	  Enable support for sending debug messages to syslog.
 

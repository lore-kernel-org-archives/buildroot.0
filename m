From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 19 Dec 2013 22:02:23 +0100
Subject: [Buildroot] [PATCH] gst-plugins-good: fix typo
	BR2_TOOLCHAIN_HAS_THREAD
Message-ID: <8ff8a1a8a7d5dfae8a57.1387486943@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/gstreamer/gst-plugins-good/Config.in |  2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

Note: I don't understand why kconfig does not check/warn on this...

diff --git a/package/gstreamer/gst-plugins-good/Config.in b/package/gstreamer/gst-plugins-good/Config.in
--- a/package/gstreamer/gst-plugins-good/Config.in
+++ b/package/gstreamer/gst-plugins-good/Config.in
@@ -214,7 +214,7 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUG
 	select BR2_PACKAGE_LIBSOUP
 
 comment "souphttpsrc needs a toolchain w/ wchar, threads"
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREAD
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SPEEX
 	bool "speex"

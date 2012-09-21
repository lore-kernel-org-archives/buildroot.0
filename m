From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 21 Sep 2012 02:54:38 +0200
Subject: [Buildroot] [PATCH 10/10] libsoup: remove redundant dependency on
	gettext
In-Reply-To: <20120921004927.11838.37292.stgit@localhost>
References: <20120921004927.11838.37292.stgit@localhost>
Message-ID: <20120921005438.11838.20896.stgit@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libsoup/Config.in |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
index 57b425f..219f822 100644
--- a/package/libsoup/Config.in
+++ b/package/libsoup/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_LIBSOUP
 	depends on BR2_USE_WCHAR # glib2 and gnutls
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  libsoup is an HTTP client/server library. It uses GObject
 	  and the GLib main loop, to integrate well with GNOME

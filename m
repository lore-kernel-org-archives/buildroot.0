From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Jul 2018 21:39:10 +0200
Subject: [Buildroot] [git commit] libsoup: update homepage link
Message-ID: <20180703193602.F1C1384404@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=adf2cf0b42b346cfa7e50e615b66d0e8756fcf59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libsoup/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
index 236d3c428a..599f9594d9 100644
--- a/package/libsoup/Config.in
+++ b/package/libsoup/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_LIBSOUP
 	  and the GLib main loop, to integrate well with GNOME
 	  applications.
 
-	  http://live.gnome.org/LibSoup
+	  https://wiki.gnome.org/Projects/libsoup
 
 if BR2_PACKAGE_LIBSOUP
 

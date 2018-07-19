From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 19:52:54 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] libsoup: update homepage
 link
Message-ID: <20180719180713.6A05D88F81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ddc7644d9eca3cd32e0333a45eadb3d278c4331
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit adf2cf0b42b346cfa7e50e615b66d0e8756fcf59)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 

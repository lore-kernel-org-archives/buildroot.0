From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  3 Jul 2018 19:56:21 +0300
Subject: [Buildroot] [PATCH] libsoup: update homepage link
Message-ID: <145dc6f9892a3f8f801bee37b3bfb172e374655c.1530636981.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libsoup/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libsoup/Config.in b/package/libsoup/Config.in
index 236d3c428a83..599f9594d932 100644
--- a/package/libsoup/Config.in
+++ b/package/libsoup/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_LIBSOUP
 	  and the GLib main loop, to integrate well with GNOME
 	  applications.
 
-	  http://live.gnome.org/LibSoup
+	  https://wiki.gnome.org/Projects/libsoup
 
 if BR2_PACKAGE_LIBSOUP
 
-- 
2.18.0

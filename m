From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 26 May 2016 16:24:33 +0300
Subject: [Buildroot] [PATCH] eudev: link to real homepage
Message-ID: <4a9840c0685e7e59af8909d3550c4122c0daa824.1464269073.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Gentoo wiki page is much more informative than the download directory.
This is the official homepage according to top level README.md.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/eudev/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index 76df409b6ce8..cda06e7678d4 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_EUDEV
 	  eudev requires a Linux kernel >= 2.6.34: it relies on devtmpfs
 	  and inotify.
 
-	  http://dev.gentoo.org/~blueness/eudev
+	  https://wiki.gentoo.org/wiki/Project:Eudev
 
 if BR2_PACKAGE_EUDEV
 
-- 
2.8.1

From: Mark Corbin <mark@dibsco.co.uk>
Date: Thu, 28 Nov 2019 11:36:29 +0000
Subject: [Buildroot] [PATCH 1/1] package/libdvdread: update the upstream URL
 in Config.in
Message-ID: <20191128113629.22385-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(404)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
---
 package/libdvdread/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libdvdread/Config.in b/package/libdvdread/Config.in
index 91bec83a40..3579054158 100644
--- a/package/libdvdread/Config.in
+++ b/package/libdvdread/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_LIBDVDREAD
 	  libdvdread provides a simple foundation for reading
 	  DVD-Video images.
 
-	  http://www.mplayerhq.hu/MPlayer/releases/dvdnav/
+	  https://www.videolan.org/developers/libdvdnav.html
-- 
2.20.1

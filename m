From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Nov 2019 16:46:32 +0100
Subject: [Buildroot] [git commit] package/libdvdread: update the upstream
 URL in Config.in
Message-ID: <20191128154138.3CDE5810D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=620bb752b2e8c4b156e4e026348484e8a88c5e64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(404)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

From: Mark Corbin <mark@dibsco.co.uk>
Date: Thu, 28 Nov 2019 11:43:41 +0000
Subject: [Buildroot] [PATCH 1/1] package/libdvdnav: update the upstream URL
 in Config.in
Message-ID: <20191128114341.24025-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the upstream URL in the help text in Config.in as it
is pointing to an old page.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
---
 package/libdvdnav/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libdvdnav/Config.in b/package/libdvdnav/Config.in
index 8cfcb4a6de..77cba5f135 100644
--- a/package/libdvdnav/Config.in
+++ b/package/libdvdnav/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_LIBDVDNAV
 	  DVD navigation features such as DVD menus, multiangle
 	  playback and even interactive DVD games.
 
-	  http://www.mplayerhq.hu
+	  https://www.videolan.org/developers/libdvdnav.html
 
 comment "libdvdnav needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.20.1

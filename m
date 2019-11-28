From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Nov 2019 16:48:14 +0100
Subject: [Buildroot] [git commit] package/libdvdnav: update the upstream URL
 in Config.in
Message-ID: <20191128154138.4614B810D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad8a1f9aae560bfa79917eda29e74a671d87e658
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the upstream URL in the help text in Config.in as it
is pointing to an old page.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

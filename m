From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 May 2016 15:50:01 +0200
Subject: [Buildroot] [git commit] eudev: link to real homepage
Message-ID: <20160526135039.A5C6E81F9A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b5630ad7125d30cb5d65de49cc2f120bb5cf62ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Gentoo wiki page is much more informative than the download directory.
This is the official homepage according to top level README.md.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/eudev/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index 76df409..cda06e7 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_EUDEV
 	  eudev requires a Linux kernel >= 2.6.34: it relies on devtmpfs
 	  and inotify.
 
-	  http://dev.gentoo.org/~blueness/eudev
+	  https://wiki.gentoo.org/wiki/Project:Eudev
 
 if BR2_PACKAGE_EUDEV
 

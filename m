From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Dec 2017 23:34:57 +0100
Subject: [Buildroot] [git commit branch/2017.11.x] xfsprogs: update homepage
 link
Message-ID: <20171227223843.DAD8281038@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=67cbca792e7216dd8d3641adfb3a7621c81cd396
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.11.x

The old SGI site is not accessible anymore. Use the link from the README
file.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1fa2f7646f11e775fc8f2e5ba729a2efb9b2e653)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xfsprogs/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xfsprogs/Config.in b/package/xfsprogs/Config.in
index fb603ad..2c72a02 100644
--- a/package/xfsprogs/Config.in
+++ b/package/xfsprogs/Config.in
@@ -13,4 +13,4 @@ config BR2_PACKAGE_XFSPROGS
 	help
 	  The XFS file system utilities and libraries
 
-	  http://oss.sgi.com/projects/xfs/
+	  http://xfs.org

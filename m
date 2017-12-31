From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Dec 2017 09:24:11 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] xfsprogs: update homepage
 link
Message-ID: <20171231083605.DD25C838FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb1dcc49e56b2a90c54371683ac00eed8173d833
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

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
index 9f0d250..78c1aa9 100644
--- a/package/xfsprogs/Config.in
+++ b/package/xfsprogs/Config.in
@@ -13,4 +13,4 @@ config BR2_PACKAGE_XFSPROGS
 	help
 	  The XFS file system utilities and libraries
 
-	  http://oss.sgi.com/projects/xfs/
+	  http://xfs.org

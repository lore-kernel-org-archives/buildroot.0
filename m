From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Dec 2017 15:32:14 +0100
Subject: [Buildroot] [git commit] xfsprogs: update homepage link
Message-ID: <20171222144123.E82D17FC9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1fa2f7646f11e775fc8f2e5ba729a2efb9b2e653
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The old SGI site is not accessible anymore. Use the link from the README
file.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xfsprogs/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xfsprogs/Config.in b/package/xfsprogs/Config.in
index 9cd4aa3..024cde9 100644
--- a/package/xfsprogs/Config.in
+++ b/package/xfsprogs/Config.in
@@ -12,4 +12,4 @@ config BR2_PACKAGE_XFSPROGS
 	help
 	  The XFS file system utilities and libraries
 
-	  http://oss.sgi.com/projects/xfs/
+	  http://xfs.org

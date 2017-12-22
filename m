From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 22 Dec 2017 13:15:27 +0200
Subject: [Buildroot] [PATCH 2/2] xfsprogs: update homepage link
In-Reply-To: <2e7d914e7b12cdac37de9790884642d6547a3752.1513941327.git.baruch@tkos.co.il>
References: <2e7d914e7b12cdac37de9790884642d6547a3752.1513941327.git.baruch@tkos.co.il>
Message-ID: <4690efda9cfb4bd4017f3769eae250fbb65b281a.1513941327.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The old SGI site is not accessible anymore. Use the link from the README
file.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
Actually, xfs.org is also down at the moment. But according to the
google cache it has been online a few days ago. We'll see.
---
 package/xfsprogs/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xfsprogs/Config.in b/package/xfsprogs/Config.in
index 9cd4aa3f9fad..024cde9fe64d 100644
--- a/package/xfsprogs/Config.in
+++ b/package/xfsprogs/Config.in
@@ -12,4 +12,4 @@ config BR2_PACKAGE_XFSPROGS
 	help
 	  The XFS file system utilities and libraries
 
-	  http://oss.sgi.com/projects/xfs/
+	  http://xfs.org
-- 
2.15.1

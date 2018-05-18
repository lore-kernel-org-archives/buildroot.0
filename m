From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 18 May 2018 14:43:01 +0300
Subject: [Buildroot] [PATCH] nfs-utils: update homepage link
Message-ID: <90d930421b2b41efab868f3e3990c6bd175e2756.1526643781.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The linux-nfs project switched to a new homepage. Update the help text
link.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/nfs-utils/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index 4e139363fce9..055b711f0d4b 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_NFS_UTILS
 	help
 	  The NFS Linux kernel server.
 
-	  http://sourceforge.net/projects/nfs
+	  http://linux-nfs.org/
 
 if BR2_PACKAGE_NFS_UTILS
 
-- 
2.17.0

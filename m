From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 May 2018 13:50:44 +0200
Subject: [Buildroot] [git commit] nfs-utils: update homepage link
Message-ID: <20180519114945.A10798845C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d7757110a18addce7f4885f6c509f9a275215cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The linux-nfs project switched to a new homepage. Update the help text
link.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nfs-utils/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index 4e139363fc..055b711f0d 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_NFS_UTILS
 	help
 	  The NFS Linux kernel server.
 
-	  http://sourceforge.net/projects/nfs
+	  http://linux-nfs.org/
 
 if BR2_PACKAGE_NFS_UTILS
 

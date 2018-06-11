From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jun 2018 22:45:46 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] nfs-utils: update
 homepage link
Message-ID: <20180611211536.C295B8832D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8fd0f9c985fff0b70dec74e7086e774d7de6cd0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

The linux-nfs project switched to a new homepage. Update the help text
link.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0d7757110a18addce7f4885f6c509f9a275215cb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 

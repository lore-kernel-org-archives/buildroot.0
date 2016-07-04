From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 23:03:38 +0200
Subject: [Buildroot] [git commit] nfs-utils: remove the menu ... endmenu
Message-ID: <20160704210406.B22F9807D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df1132f6e0ec6d37c87de2f9f26d63df11a1a051
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With only 3 sub-options, it doesn't really make a lot of sense to have a
sub-menu, so kill it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nfs-utils/Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index 1273092..bfaddd1 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -15,8 +15,6 @@ config BR2_PACKAGE_NFS_UTILS
 
 if BR2_PACKAGE_NFS_UTILS
 
-menu "NFS utilities selection"
-
 config BR2_PACKAGE_NFS_UTILS_RPCDEBUG
 	bool "rpcdebug"
 	help
@@ -32,6 +30,4 @@ config BR2_PACKAGE_NFS_UTILS_RPC_RQUOTAD
 	help
 	  NFS remote quota server
 
-endmenu
-
 endif

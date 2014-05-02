From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 May 2014 09:25:02 +0200
Subject: [Buildroot] [git commit] system/Config.in: fix custom skeleton help
	text
Message-ID: <20140502083212.9696D9C837@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4e5515382de952664398e1b8378b662d07f762e5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 system/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 2ab14ce..a3d80bf 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -185,7 +185,7 @@ config BR2_ROOTFS_SKELETON_CUSTOM_PATH
 	string "custom target skeleton path"
 	default "system/skeleton"
 	help
-	  Path custom target skeleton.
+	  Path to custom target skeleton.
 endif
 
 if BR2_ROOTFS_SKELETON_DEFAULT

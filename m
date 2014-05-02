From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 02 May 2014 07:08:40 +0200
Subject: [Buildroot] [PATCH] system/Config.in: fix custom skeleton help text
Message-ID: <31b1f7dff163950c1236.1399007320@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 system/Config.in |  2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/system/Config.in b/system/Config.in
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

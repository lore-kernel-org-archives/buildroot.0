From: Matt Kraai <kraai@ftbfs.org>
Date: Mon, 10 Oct 2016 06:45:59 -0700
Subject: [Buildroot] [PATCH] system: fix typo
Message-ID: <20161010134559.27087-1-kraai@ftbfs.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Kraai <kraai@ftbfs.org>
---
 system/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/Config.in b/system/Config.in
index d3b2889..f9a3bda 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -509,7 +509,7 @@ config BR2_ROOTFS_POST_FAKEROOT_SCRIPT
 
 	  This gives users the opportunity to do customisations of the
 	  content of the rootfs, which would otherwise require root
-	  rigths.
+	  rights.
 
 	  These scripts are called with the target directory name as
 	  first argument. The build will fail on the first scripts that
-- 
2.9.3

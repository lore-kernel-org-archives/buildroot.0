From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu,  1 May 2014 17:26:36 -0500
Subject: [Buildroot] [PATCH 1/1] system: fix spelling errors
Message-ID: <1398983196-52878-1-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix minor spelling errors that exists in system/Config.in

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 system/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 0b4f20a..2ab14ce 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -347,7 +347,7 @@ config BR2_ROOTFS_POST_BUILD_SCRIPT
 	  has finished and before Buildroot starts packing the files into
 	  selected filesystem images.
 
-	  This gives users the oportunity to do board-specific cleanups,
+	  This gives users the opportunity to do board-specific cleanups,
 	  add-ons and the like, so the generated files can be used directly
 	  without further processing.
 
@@ -377,7 +377,7 @@ config BR2_ROOTFS_POST_SCRIPT_ARGS
 	string "Extra post-{build,image} arguments"
 	depends on BR2_ROOTFS_POST_BUILD_SCRIPT != "" || BR2_ROOTFS_POST_IMAGE_SCRIPT != ""
 	help
-	  Pass these aditional arguments to each post-build or post-image
+	  Pass these additional arguments to each post-build or post-image
 	  scripts.
 
 	  Note that all the post-build and post-image scripts will be passed
-- 
1.9.0

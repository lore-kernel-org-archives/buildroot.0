From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 May 2014 09:24:45 +0200
Subject: [Buildroot] [git commit] system: fix spelling errors
Message-ID: <20140502083212.8678E9CABE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5f71cc90d689721eac10e1622b4d4056530e9269
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix minor spelling errors that exists in system/Config.in

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 system/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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

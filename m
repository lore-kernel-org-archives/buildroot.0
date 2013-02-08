From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 8 Feb 2013 22:06:50 +0100
Subject: [Buildroot] [git commit] Adjust prompt for the post-build scripts
	option
Message-ID: <20130208210652.629FD800DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c482eed74c5238065ab1211c1e094be656fcda4f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the post-image config option uses the plural for "Custom
scripts", do the same for the post-build config option, for
consistency.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 system/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index bdd47c5..1e4fff3 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -261,7 +261,7 @@ config BR2_ROOTFS_OVERLAY
 	  ~ and .git, .svn and .hg directories.
 
 config BR2_ROOTFS_POST_BUILD_SCRIPT
-	string "Custom script to run before creating filesystem images"
+	string "Custom scripts to run before creating filesystem images"
 	default ""
 	help
 	  Specify a space-separated list of scripts to be run after the build

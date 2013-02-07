From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  7 Feb 2013 22:58:48 +0100
Subject: [Buildroot] [PATCH v3 6/6] Adjust prompt for the post-build scripts
	option
In-Reply-To: <1360274328-14754-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1360274328-14754-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1360274328-14754-7-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the post-image config option uses the plural for "Custom
scripts", do the same for the post-build config option, for
consistency.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 system/Config.in |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.7.9.5

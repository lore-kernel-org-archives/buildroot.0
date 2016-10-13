From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Oct 2016 08:06:11 +0200
Subject: [Buildroot] [git commit] system: fix typo
Message-ID: <20161013060802.6BD2682269@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b0434437afee60dd9b0ba994fb77d6ca8766fe6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matt Kraai <kraai@ftbfs.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

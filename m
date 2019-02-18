From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Feb 2019 17:23:43 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] linux: bump CIP to
 version v4.4.154-cip28
Message-ID: <20190218162256.2A1E78196D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d66510b7b8341039c58b5f7df2074358b26c5950
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

This patch bumps the Linux CIP kernel to version v4.4.154-cip28

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a91db4044feefc4512a3d0dafb711924a3c43237)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index e931bd4136..9240dcd4f0 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -33,7 +33,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (4.15)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (v4.4.138-cip25)"
+	bool "Latest CIP SLTS version (v4.4.154-cip28)"
 	help
 	  CIP launched in the spring of 2016 to address the needs of
 	  organizations in industries such as power generation and
@@ -121,7 +121,7 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "4.15.16" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "v4.4.138-cip25" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "v4.4.154-cip28" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL

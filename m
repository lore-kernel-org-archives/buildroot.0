From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Nov 2018 15:48:17 +0100
Subject: [Buildroot] [git commit] linux: bump CIP to version v4.4.154-cip28
Message-ID: <20181129144543.09A6D80368@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a91db4044feefc4512a3d0dafb711924a3c43237
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps the Linux CIP kernel to version v4.4.154-cip28

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 85e540754a..efce31c7e1 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -33,7 +33,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (4.18)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (v4.4.138-cip25)"
+	bool "Latest CIP SLTS version (v4.4.154-cip28)"
 	help
 	  CIP launched in the spring of 2016 to address the needs of
 	  organizations in industries such as power generation and
@@ -121,7 +121,7 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "4.18.20" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "v4.4.138-cip25" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "v4.4.154-cip28" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL

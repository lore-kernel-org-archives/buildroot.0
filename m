From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Aug 2019 19:34:43 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] linux: bump CIP to
 version v4.19.60-cip7
Message-ID: <20190804201500.66FBC8E431@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=29186f8c832f682b2664bcf9a33551e4b7f05425
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

This patch bumps Linux CIP to version v4.19.60-cip7.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1fcb7a3a2ce34d110a1bef1d80ea6c94a8260cb0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index a80bd696e4..dcb517c84b 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -34,7 +34,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (5.1)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (v4.19.13-cip1)"
+	bool "Latest CIP SLTS version (v4.19.60-cip7)"
 	help
 	  CIP launched in the spring of 2016 to address the needs of
 	  organizations in industries such as power generation and
@@ -122,7 +122,7 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "5.1.16" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "v4.19.13-cip1" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "v4.19.60-cip7" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL

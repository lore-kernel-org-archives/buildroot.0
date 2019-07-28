From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Jul 2019 22:40:14 +0200
Subject: [Buildroot] [git commit] linux: bump CIP to version v4.19.60-cip7
Message-ID: <20190728203958.5256D80282@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1fcb7a3a2ce34d110a1bef1d80ea6c94a8260cb0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps Linux CIP to version v4.19.60-cip7.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 9076f40ce6..7ed61d1923 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -35,7 +35,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (5.2)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (v4.19.13-cip1)"
+	bool "Latest CIP SLTS version (v4.19.60-cip7)"
 	help
 	  CIP launched in the spring of 2016 to address the needs of
 	  organizations in industries such as power generation and
@@ -123,7 +123,7 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "5.2" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "v4.19.13-cip1" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "v4.19.60-cip7" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL

From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Jan 2018 22:49:41 +0100
Subject: [Buildroot] [git commit] linux: bump Linux CIP to v4.4.112-cip18
Message-ID: <20180130215615.4898586038@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a2f8eafdfabb1073a89327ebd190a9383adc539e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bump the Linux CIP kernel to version v4.4.112-cip18

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 115247f653..aef17c0c7e 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -29,7 +29,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (4.15)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (v4.4.105-cip15)"
+	bool "Latest CIP SLTS version (v4.4.112-cip18)"
 	help
 	  CIP launched in the spring of 2016 to address the needs of
 	  organizations in industries such as power generation and
@@ -117,7 +117,7 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "4.15" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "v4.4.105-cip15" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "v4.4.112-cip18" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL

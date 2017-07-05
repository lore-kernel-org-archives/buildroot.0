From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 5 Jul 2017 20:23:54 +0200
Subject: [Buildroot] [git commit] linux: bump default version to 4.11.9
Message-ID: <20170705182133.5E5BC81935@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bfe176bbda3d0f3e6982fcdc873a8fb0a59a53a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 281c437..c110384 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -26,7 +26,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (4.11.8)"
+	bool "Latest version (4.11.9)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (v4.4.55-cip3)"
@@ -116,7 +116,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.11.8" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.11.9" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.55-cip3" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION

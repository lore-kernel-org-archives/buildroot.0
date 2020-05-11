From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 May 2020 21:13:42 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] linux: bump CIP RT kernel
 to version 4.19.115-cip24-rt9
Message-ID: <20200511190851.276949147A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a99fe9928bb141f349efb79d632ca4549ec69feb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

This patch bumps Linux CIP RT version to 4.19.115-cip24-rt9.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2452aa182dbf2fc7c1da9f5aa28709b8e431c58a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 71e4382eb8..9e4d2ea427 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -49,7 +49,7 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	  https://www.cip-project.org
 
 config BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
-	bool "Latest CIP RT SLTS version (4.19.98-cip19-rt7)"
+	bool "Latest CIP RT SLTS version (4.19.115-cip24-rt9)"
 	help
 	  Same as the CIP version, but this is the PREEMPT_RT realtime
 	  variant.
@@ -130,7 +130,7 @@ config BR2_LINUX_KERNEL_VERSION
 	string
 	default "5.4.35" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.118-cip25" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	default "4.19.98-cip19-rt7" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
+	default "4.19.115-cip24-rt9" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL

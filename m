From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Aug 2019 16:20:09 +0200
Subject: [Buildroot] [git commit] linux: bump CIP to version v4.19.65-cip8
Message-ID: <20190813190703.4CB0B8DEFA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9741de846678a795a7558affeb817e37f50b8750
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps Linux CIP to version v4.19.65-cip8.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 544f6bff3d..99f50f2d43 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -35,7 +35,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (5.2)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (v4.19.60-cip7)"
+	bool "Latest CIP SLTS version (v4.19.65-cip8)"
 	help
 	  CIP launched in the spring of 2016 to address the needs of
 	  organizations in industries such as power generation and
@@ -123,7 +123,7 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "5.2.5" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "v4.19.60-cip7" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "v4.19.65-cip8" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL

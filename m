From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 May 2020 21:13:16 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] linux: bump CIP kernel to
 version 4.19.118-cip25
Message-ID: <20200511190851.186F19147A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf23a44dddfe2f9d4ad6aca155396cb51e41e33c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

This patch bumps Linux CIP version to v4.19.118-cip25.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1b53b94690014c6db6713b7a69ebe8e4da2d5f7f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index bdf3c26326..71e4382eb8 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -30,7 +30,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (5.4)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (4.19.98-cip19)"
+	bool "Latest CIP SLTS version (4.19.118-cip25)"
 	help
 	  CIP launched in the spring of 2016 to address the needs of
 	  organizations in industries such as power generation and
@@ -129,7 +129,7 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "5.4.35" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "4.19.98-cip19" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "4.19.118-cip25" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.98-cip19-rt7" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION

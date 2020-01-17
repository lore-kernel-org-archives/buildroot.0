From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Jan 2020 22:09:19 +0100
Subject: [Buildroot] [git commit] linux: bump CIP kernel to version
 4.19.94-cip18
Message-ID: <20200117210013.1E68582581@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c5ccab6904f88fc9a427382c2447e6438eda631
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps Linux CIP version to 4.19.94-cip18.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 90d1c215fb..07692c52df 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -30,7 +30,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (5.4)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (4.19.88-cip16)"
+	bool "Latest CIP SLTS version (4.19.94-cip18)"
 	help
 	  CIP launched in the spring of 2016 to address the needs of
 	  organizations in industries such as power generation and
@@ -129,7 +129,7 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "5.4.10" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "4.19.88-cip16" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "4.19.94-cip18" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.82-cip14-rt5" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION

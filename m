From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Jan 2020 22:10:05 +0100
Subject: [Buildroot] [git commit] linux: bump CIP RT kernel to version
 4.19.90-cip16-rt6
Message-ID: <20200117210013.2781582581@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c689577438a7d1b25799bf46ec9016e7c3815196
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps Linux CIP RT version to 4.19.90-cip16-rt6.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 07692c52df..41384f84a1 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -49,7 +49,7 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	  https://www.cip-project.org
 
 config BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
-	bool "Latest CIP RT SLTS version (4.19.82-cip14-rt5)"
+	bool "Latest CIP RT SLTS version (4.19.90-cip16-rt6)"
 	help
 	  Same as the CIP version, but this is the PREEMPT_RT realtime
 	  variant.
@@ -130,7 +130,7 @@ config BR2_LINUX_KERNEL_VERSION
 	string
 	default "5.4.10" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.94-cip18" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	default "4.19.82-cip14-rt5" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
+	default "4.19.90-cip16-rt6" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL

From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Nov 2018 17:37:34 +0100
Subject: [Buildroot] [git commit] linux: bump default to 4.19.2
Message-ID: <20181202071557.5003681583@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=377944f65a74670075c1878a0b6b61ad84856ed5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index ecb12d0b16..c75e149a37 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -30,7 +30,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (4.18)"
+	bool "Latest version (4.19)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (v4.4.138-cip25)"
@@ -120,7 +120,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.18.14" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.19.2" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.138-cip25" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION

From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Mar 2014 15:26:32 +0100
Subject: [Buildroot] [git commit] linux: bump to version 3.13.7
Message-ID: <20140324142757.1FE029C32D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9bedea7fc9539d5a47dad229cd1bd0b627fa43a2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 5db0e0c..20f08f0 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -21,7 +21,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "3.13.6"
+	bool "3.13.7"
 
 config BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	bool "Same as toolchain kernel headers"
@@ -104,7 +104,7 @@ config BR2_LINUX_KERNEL_CUSTOM_LOCAL_PATH
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "3.13.6" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "3.13.7" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION

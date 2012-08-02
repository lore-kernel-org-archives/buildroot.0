From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:36 -0000
Subject: [Buildroot] [git commit branch/next] linux: bump default to kernel
	version 3.3.6
Message-ID: <20120802195231.46A3296EA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b18b57f6349fa341ee2e4d82c9859bc646a05bf0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 7595a4a..dd34465 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -22,7 +22,7 @@ choice
 	default BR2_LINUX_KERNEL_3_3
 
 config BR2_LINUX_KERNEL_3_3
-	bool "3.3.5"
+	bool "3.3.6"
 
 config BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	bool "Same as toolchain kernel headers"
@@ -77,7 +77,7 @@ config BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "3.3.5" if BR2_LINUX_KERNEL_3_3
+	default "3.3.6" if BR2_LINUX_KERNEL_3_3
 	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL

From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 11 Dec 2012 21:26:07 +0100
Subject: [Buildroot] [git commit] linux: bump to 3.7.x version
Message-ID: <20121212061933.E002E9A1AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=121de4819d0be56f014aea9db275392ebd2f60da
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/Config.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index ef3b2a1..51810e2 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -20,8 +20,8 @@ if BR2_LINUX_KERNEL
 choice
 	prompt "Kernel version"
 
-config BR2_LINUX_KERNEL_3_6
-	bool "3.6.9"
+config BR2_LINUX_KERNEL_3_7
+	bool "3.7"
 
 config BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	bool "Same as toolchain kernel headers"
@@ -76,7 +76,7 @@ config BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "3.6.9" if BR2_LINUX_KERNEL_3_6
+	default "3.7" if BR2_LINUX_KERNEL_3_7
 	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL

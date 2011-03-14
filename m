From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 15 Mar 2011 00:02:55 +0100
Subject: [Buildroot] [git commit master 1/1] linux: bump 2.6.37.x stable
	version
Message-ID: <20110314230312.C1DDE8FFE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=cfde89c0972ceed774bac9658a0138f55a2d61f6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 9d514c5..bdfdf9a 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -22,7 +22,7 @@ choice
 	default BR2_LINUX_KERNEL_2_6_37
 
 config BR2_LINUX_KERNEL_2_6_37
-	bool "2.6.37.2"
+	bool "2.6.37.4"
 
 config BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	bool "Same as toolchain kernel headers"
@@ -60,7 +60,7 @@ config BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "2.6.37" if BR2_LINUX_KERNEL_2_6_37
+	default "2.6.37.4" if BR2_LINUX_KERNEL_2_6_37
 	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
-- 
1.7.3.4

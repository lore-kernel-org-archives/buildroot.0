From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 25 Feb 2011 12:00:37 +0100
Subject: [Buildroot] [git commit master 1/1] linux: bump 2.6.37.x stable
	version
Message-ID: <20110225110122.E5C7F8F75A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ed9737388fab1f20ca9ba0cc743bd9616c0946a9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index bdb1abe..9d514c5 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -22,7 +22,7 @@ choice
 	default BR2_LINUX_KERNEL_2_6_37
 
 config BR2_LINUX_KERNEL_2_6_37
-	bool "2.6.37"
+	bool "2.6.37.2"
 
 config BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	bool "Same as toolchain kernel headers"
@@ -52,7 +52,7 @@ endchoice
 config BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE
 	string "Kernel version"
 	depends on BR2_LINUX_KERNEL_CUSTOM_VERSION
-	default "2.6.37"
+	default "2.6.37.2"
 
 config BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION
 	string "URL of custom kernel tarball"
-- 
1.7.3.4

From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 21 Sep 2010 12:18:44 +0200
Subject: [Buildroot] [git commit master 1/1] kernel-headers/linux: bump
	2.6.35.x stable version
Message-ID: <20100921143036.87ADF8B440@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=386c55dbba5464ff777e149e2266b90943e53157
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/Config.in                    |    2 +-
 toolchain/kernel-headers/Config.in |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 9752e69..c8c34b4 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -22,7 +22,7 @@ choice
 	default BR2_LINUX_KERNEL_2_6_35
 
 config BR2_LINUX_KERNEL_2_6_35
-	bool "2.6.35.4"
+	bool "2.6.35.5"
 
 config BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	bool "Same as toolchain kernel headers"
diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index ca416f9..025e6a3 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -63,6 +63,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.32.22"	if BR2_KERNEL_HEADERS_2_6_32
 	default "2.6.33.7"	if BR2_KERNEL_HEADERS_2_6_33
 	default "2.6.34.7"	if BR2_KERNEL_HEADERS_2_6_34
-	default "2.6.35.4"	if BR2_KERNEL_HEADERS_2_6_35
+	default "2.6.35.5"	if BR2_KERNEL_HEADERS_2_6_35
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.7.1

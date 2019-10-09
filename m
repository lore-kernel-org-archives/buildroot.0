From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2019 22:53:04 +0200
Subject: [Buildroot] [git commit] linux: bump CIP to version v4.19.75-cip11
Message-ID: <20191009204819.7784A8B8E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a1f5be17fa9776220aef1b82543ab6820f49e792
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bump CIP to version v4.19.75-cip11.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 2760e8d69c..07e17b8573 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -35,7 +35,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (5.3)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (v4.19.65-cip8)"
+	bool "Latest CIP SLTS version (v4.19.75-cip11)"
 	help
 	  CIP launched in the spring of 2016 to address the needs of
 	  organizations in industries such as power generation and
@@ -123,7 +123,7 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "5.3.4" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "v4.19.65-cip8" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "v4.19.75-cip11" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL

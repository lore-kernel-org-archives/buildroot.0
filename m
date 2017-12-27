From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Dec 2017 10:44:21 +0100
Subject: [Buildroot] [git commit branch/2017.11.x] linux: bump Linux CIP to
 v4.4.98-cip13
Message-ID: <20171227095308.BDD138294B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7567b9cce47dd41dd13f9d9b243e304fca10af69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.11.x

This patch bump the Linux CIP kernel to version v4.4.98-cip13

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 130b01d52bbcaa788915f3b2d337d17a0ce74724)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 41f039e..79070ad 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -29,7 +29,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (4.13)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (v4.4.83-cip8)"
+	bool "Latest CIP SLTS version (v4.4.98-cip13)"
 	help
 	  CIP launched in the spring of 2016 to address the needs of
 	  organizations in industries such as power generation and
@@ -117,7 +117,7 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "4.13.16" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "v4.4.83-cip8" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "v4.4.98-cip13" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL

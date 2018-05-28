From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 May 2018 20:22:16 +0200
Subject: [Buildroot] [git commit] linux: bump Linux CIP to v4.4.130-cip23
Message-ID: <20180528182059.29A8382A8A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=299bdf6df83bfb8a960963bb2e7d7bf8f99d47f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bump the Linux CIP kernel to version v4.4.130-cip23

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 33d879588c..b1691fe153 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -29,7 +29,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (4.16)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (v4.4.112-cip18)"
+	bool "Latest CIP SLTS version (v4.4.130-cip23)"
 	help
 	  CIP launched in the spring of 2016 to address the needs of
 	  organizations in industries such as power generation and
@@ -117,7 +117,7 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "4.16.12" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "v4.4.112-cip18" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "v4.4.130-cip23" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL

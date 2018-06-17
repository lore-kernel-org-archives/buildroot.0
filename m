From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jun 2018 16:43:40 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] linux: bump Linux CIP to
 v4.4.130-cip23
Message-ID: <20180617150240.DDC9381213@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f02de6ebcf404d637c7bf7884854d82cd360d99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

This patch bump the Linux CIP kernel to version v4.4.130-cip23

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 299bdf6df83bfb8a960963bb2e7d7bf8f99d47f0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 142d42e10c..e8653ea17e 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -29,7 +29,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (4.15)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (v4.4.112-cip18)"
+	bool "Latest CIP SLTS version (v4.4.130-cip23)"
 	help
 	  CIP launched in the spring of 2016 to address the needs of
 	  organizations in industries such as power generation and
@@ -117,7 +117,7 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "4.15.16" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "v4.4.112-cip18" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "v4.4.130-cip23" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL

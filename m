From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Aug 2018 00:17:44 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] linux: bump CIP to
 version v4.4.138-cip25
Message-ID: <20180823221112.0126D8DF4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10a3e2ea85f1fba6b454719f481f00291eb52d68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

This patch bumps the CIP Linux kernel to version v4.4.138-cip25

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f2e3e3712485ace7a964505a517ed92fdbcc4517)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 6f5c0ea694..e931bd4136 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -33,7 +33,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (4.15)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (v4.4.130-cip23)"
+	bool "Latest CIP SLTS version (v4.4.138-cip25)"
 	help
 	  CIP launched in the spring of 2016 to address the needs of
 	  organizations in industries such as power generation and
@@ -121,7 +121,7 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "4.15.16" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "v4.4.130-cip23" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "v4.4.138-cip25" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL

From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Dec 2017 17:11:55 +0100
Subject: [Buildroot] [git commit branch/2017.11.x] linux: bump CIP version
 to v4.4.105-cip15
Message-ID: <20171227161504.3D7638362A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=20f76f01982b3efbf7b89b30d8f631e7d8292b3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.11.x

This patch bumps the Linux CIP version to v4.4.105-cip15.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e78cf9322d9e1477ac6878c211c351722db3720a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 79070ad..33c3502 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -29,7 +29,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	bool "Latest version (4.13)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (v4.4.98-cip13)"
+	bool "Latest CIP SLTS version (v4.4.105-cip15)"
 	help
 	  CIP launched in the spring of 2016 to address the needs of
 	  organizations in industries such as power generation and
@@ -117,7 +117,7 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "4.13.16" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "v4.4.98-cip13" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "v4.4.105-cip15" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL

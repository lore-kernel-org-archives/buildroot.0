From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Oct 2015 15:30:38 +0200
Subject: [Buildroot] [git commit] Config.in.legacy: remove incorrect
	BR2_LEGACY selects
Message-ID: <20151009133111.6670581EE3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=37ad0f8d7000c0be5ea47c4b968241311cc27560
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We shouldn't select BR2_LEGACY for string options.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 921c7ef..d8d3996 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -1172,7 +1172,6 @@ config BR2_TARGET_TZ_ZONELIST
 
 config BR2_PACKAGE_TZDATA_ZONELIST
 	string "tzdata: the timezone list option has been renamed"
-	select BR2_LEGACY
 	help
 	  The option BR2_PACKAGE_TZDATA_ZONELIST has been renamed to
 	  BR2_TARGET_TZ_ZONELIST, and moved to the "System configuration"
@@ -1527,7 +1526,6 @@ config BR2_PACKAGE_MODULE_INIT_TOOLS
 
 config BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL
 	string "u-boot: the git repository URL option has been renamed"
-	select BR2_LEGACY
 	help
 	  The option BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL has
 	  been renamed to BR2_TARGET_UBOOT_CUSTOM_REPO_URL.
@@ -1542,7 +1540,6 @@ config BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL_WRAP
 
 config BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION
 	string "u-boot: the git repository version option has been renamed"
-	select BR2_LEGACY
 	help
 	  The option BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION has
 	  been renamed to BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION.
@@ -1557,7 +1554,6 @@ config BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION_WRAP
 
 config BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL
 	string "linux: the git repository URL option has been renamed"
-	select BR2_LEGACY
 	help
 	  The option BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL has
 	  been renamed to
@@ -1573,7 +1569,6 @@ config BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL_WRAP
 
 config BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION
 	string "linux: the git repository version option has been renamed"
-	select BR2_LEGACY
 	help
 	  The option BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION has
 	  been renamed to

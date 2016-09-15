From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Sep 2016 11:56:45 +0200
Subject: [Buildroot] [git commit] linux: bump default to version 4.7.4
Message-ID: <20160915095728.9814D80339@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9294348f4d88076e0fc17ad308c7faeb93468994
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index fd6b4b3..ab4e138 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -26,7 +26,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (4.7.3)"
+	bool "Latest version (4.7.4)"
 
 config BR2_LINUX_KERNEL_CUSTOM_VERSION
 	bool "Custom version"
@@ -97,7 +97,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.7.3" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.7.4" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL

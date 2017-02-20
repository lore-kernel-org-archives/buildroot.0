From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Feb 2017 21:55:50 +0100
Subject: [Buildroot] [git commit branch/next] linux: bump default to version
	4.10
Message-ID: <20170220205659.5D64181945@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=400eaa3452e9380ec77ac62266530055506ea6e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/Config.in | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 740dd39..7f18219 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -26,7 +26,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (4.9.9)"
+	bool "Latest version (4.10)"
 
 config BR2_LINUX_KERNEL_CUSTOM_VERSION
 	bool "Custom version"
@@ -97,7 +97,11 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
+<<<<<<< a1e02440f3035cfbe5119c00457b3e1c2f7ac4d1
 	default "4.9.9" if BR2_LINUX_KERNEL_LATEST_VERSION
+=======
+	default "4.10" if BR2_LINUX_KERNEL_LATEST_VERSION
+>>>>>>> linux: bump default to version 4.10
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL

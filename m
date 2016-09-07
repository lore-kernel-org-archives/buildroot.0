From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 7 Sep 2016 10:11:53 +0100
Subject: [Buildroot] [PATCH 2/2] linux: bump default to version 4.7.3
In-Reply-To: <1473239513-987-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1473239513-987-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1473239513-987-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 43d63c0..4b701a4 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -26,7 +26,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (4.7.2)"
+	bool "Latest version (4.7.3)"
 
 config BR2_LINUX_KERNEL_CUSTOM_VERSION
 	bool "Custom version"
@@ -97,7 +97,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.7.2" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.7.3" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
-- 
2.7.3

From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 22 Mar 2017 13:19:28 +0000
Subject: [Buildroot] [PATCH 2/2] linux: bump default version to 4.10.5
In-Reply-To: <20170322131928.5150-1-Vincent.Riera@imgtec.com>
References: <20170322131928.5150-1-Vincent.Riera@imgtec.com>
Message-ID: <20170322131928.5150-2-Vincent.Riera@imgtec.com>
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
index 3e2e6d5..5e395a4 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -26,7 +26,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (4.10.4)"
+	bool "Latest version (4.10.5)"
 
 config BR2_LINUX_KERNEL_CUSTOM_VERSION
 	bool "Custom version"
@@ -97,7 +97,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.10.4" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.10.5" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
-- 
2.10.2

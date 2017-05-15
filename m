From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 15 May 2017 12:36:12 +0100
Subject: [Buildroot] [PATCH master 2/2] linux: bump default version to 4.11.1
In-Reply-To: <20170515113612.45653-1-Vincent.Riera@imgtec.com>
References: <20170515113612.45653-1-Vincent.Riera@imgtec.com>
Message-ID: <20170515113612.45653-2-Vincent.Riera@imgtec.com>
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
index ace007cc9..41545f778 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -26,7 +26,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (4.11)"
+	bool "Latest version (4.11.1)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (v4.4.55-cip3)"
@@ -116,7 +116,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.11" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.11.1" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.55-cip3" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
-- 
2.13.0

From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 27 Apr 2017 14:43:29 +0100
Subject: [Buildroot] [PATCH 2/2] linux: bump default version to 4.10.13
In-Reply-To: <20170427134329.60945-1-Vincent.Riera@imgtec.com>
References: <20170427134329.60945-1-Vincent.Riera@imgtec.com>
Message-ID: <20170427134329.60945-2-Vincent.Riera@imgtec.com>
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
index b651152..dc19a62 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -26,7 +26,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (4.10.12)"
+	bool "Latest version (4.10.13)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (v4.4.55-cip3)"
@@ -116,7 +116,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.10.12" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.10.13" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.55-cip3" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
-- 
2.10.2

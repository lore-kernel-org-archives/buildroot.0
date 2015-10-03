From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sat, 3 Oct 2015 22:08:06 +0100
Subject: [Buildroot] [PATCH 2/2] linux: bump default version to 4.2.3
In-Reply-To: <1443906486-11119-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1443906486-11119-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1443906486-11119-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 linux/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 2be91bb..bb4f86b 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -21,7 +21,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "4.2.2"
+	bool "4.2.3"
 
 config BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	bool "Same as toolchain kernel headers"
@@ -109,7 +109,7 @@ config BR2_LINUX_KERNEL_CUSTOM_LOCAL_PATH
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.2.2" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.2.3" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
-- 
1.7.1

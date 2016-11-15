From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 15 Nov 2016 10:01:23 +0000
Subject: [Buildroot] [PATCH next 2/2] linux: bump default to version 4.8.8
In-Reply-To: <20161115100123.32010-1-Vincent.Riera@imgtec.com>
References: <20161115100123.32010-1-Vincent.Riera@imgtec.com>
Message-ID: <20161115100123.32010-2-Vincent.Riera@imgtec.com>
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
index 3f4097d..69bde25 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -26,7 +26,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (4.8.6)"
+	bool "Latest version (4.8.8)"
 
 config BR2_LINUX_KERNEL_CUSTOM_VERSION
 	bool "Custom version"
@@ -97,7 +97,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.8.6" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.8.8" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
-- 
2.10.1

From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 21 Nov 2016 10:49:28 +0000
Subject: [Buildroot] [PATCH v3 2/2] linux: bump default to version 4.8.10
In-Reply-To: <20161121104928.44869-1-Vincent.Riera@imgtec.com>
References: <20161121104928.44869-1-Vincent.Riera@imgtec.com>
Message-ID: <20161121104928.44869-2-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v2 -> v3:
 - bump to 4.8.10 instead of 4.8.8
Changes v1 -> v2:
 - rebase on top of master
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 7e141a2..d8ac5fa 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -26,7 +26,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (4.8.7)"
+	bool "Latest version (4.8.10)"
 
 config BR2_LINUX_KERNEL_CUSTOM_VERSION
 	bool "Custom version"
@@ -97,7 +97,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.8.7" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.8.10" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
-- 
2.10.1

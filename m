From: Samuel Martin <s.martin49@gmail.com>
Date: Mon,  1 May 2017 09:26:44 +0200
Subject: [Buildroot] [PATCH 2/3] linux: bump default to version 4.11
In-Reply-To: <20170501072645.5571-1-s.martin49@gmail.com>
References: <20170501072645.5571-1-s.martin49@gmail.com>
Message-ID: <20170501072645.5571-2-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index dc19a628f..ace007cc9 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -26,7 +26,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (4.10.13)"
+	bool "Latest version (4.11)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (v4.4.55-cip3)"
@@ -116,7 +116,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.10.13" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.11" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.55-cip3" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
-- 
2.12.2

From: Joel Stanley <joel@jms.id.au>
Date: Thu,  6 Jul 2017 14:26:17 +0930
Subject: [Buildroot] [PATCH 3/3] linux: bump default to version 4.12
In-Reply-To: <20170706045617.12847-1-joel@jms.id.au>
References: <20170706045617.12847-1-joel@jms.id.au>
Message-ID: <20170706045617.12847-3-joel@jms.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index c110384a973a..c9dadcd0967b 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -26,7 +26,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (4.11.9)"
+	bool "Latest version (4.12)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (v4.4.55-cip3)"
@@ -116,7 +116,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.11.9" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.12" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.55-cip3" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
-- 
2.13.2

From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Tue, 19 Apr 2016 16:52:32 -0400
Subject: [Buildroot] [PATCH 1/4] linux: explicit latest kernel version
In-Reply-To: <1461099155-30702-1-git-send-email-vivien.didelot@savoirfairelinux.com>
References: <1461099155-30702-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Message-ID: <1461099155-30702-2-git-send-email-vivien.didelot@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When setting BR2_LINUX_KERNEL_LATEST_VERSION, it is hard for the user to
know that this version is subject to change in the future.

Explicit this in the Kconfig entry text.

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
---
 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 043b147..8600ea1 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -27,7 +27,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "4.5.1"
+	bool "Latest version (4.5.1)"
 
 config BR2_LINUX_KERNEL_CUSTOM_VERSION
 	bool "Custom version"
-- 
2.8.0

From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  5 Apr 2013 17:48:50 -0300
Subject: [Buildroot] [PATCH 2/2] linux: bump 3.8.x stable version
In-Reply-To: <1365194930-22775-1-git-send-email-gustavo@zacarias.com.ar>
References: <1365194930-22775-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1365194930-22775-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index df718c3..8208277 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -21,7 +21,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_3_8
-	bool "3.8.5"
+	bool "3.8.6"
 
 config BR2_LINUX_KERNEL_SAME_AS_HEADERS
 	bool "Same as toolchain kernel headers"
-- 
1.8.1.5

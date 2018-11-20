From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 20 Nov 2018 15:30:08 +0200
Subject: [Buildroot] [PATCH next 3/5] linux: bump default to 4.19.2
In-Reply-To: <fb495883400fc9180b163358cf5c17d2f2c2e7d5.1542720610.git.baruch@tkos.co.il>
References: <fb495883400fc9180b163358cf5c17d2f2c2e7d5.1542720610.git.baruch@tkos.co.il>
Message-ID: <609476d55acd733a48a1c73702506c7a1f908ac1.1542720610.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 linux/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index ecb12d0b1666..c75e149a3739 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -30,7 +30,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (4.18)"
+	bool "Latest version (4.19)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (v4.4.138-cip25)"
@@ -120,7 +120,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.18.14" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.19.2" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.138-cip25" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
-- 
2.19.1

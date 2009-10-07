From: Daniel Mack <daniel@caiaq.de>
Date: Wed,  7 Oct 2009 13:16:42 +0800
Subject: [Buildroot] [PATCH] kernel-headers: bump 2.6.31 stable version
Message-ID: <1254892603-29653-1-git-send-email-daniel@caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Daniel Mack <daniel@caiaq.de>
---
 toolchain/kernel-headers/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 1141d88..a704402 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -57,6 +57,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.28.10"	if BR2_KERNEL_HEADERS_2_6_28
 	default "2.6.29.6"	if BR2_KERNEL_HEADERS_2_6_29
 	default "2.6.30.9"	if BR2_KERNEL_HEADERS_2_6_30
-	default "2.6.31.2"	if BR2_KERNEL_HEADERS_2_6_31
+	default "2.6.31.3"	if BR2_KERNEL_HEADERS_2_6_31
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 
-- 
1.6.0.4

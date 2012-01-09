From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  9 Jan 2012 10:50:30 -0300
Subject: [Buildroot] [PATCH] kernel-headers: bump 3.1.x series to version
	3.1.8
Message-ID: <1326117030-927-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/kernel-headers/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index ccd7a30..e6b2909 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -61,7 +61,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.38.8"	if BR2_KERNEL_HEADERS_2_6_38
 	default "2.6.39.4"	if BR2_KERNEL_HEADERS_2_6_39
 	default "3.0.15"	if BR2_KERNEL_HEADERS_3_0
-	default "3.1.7"		if BR2_KERNEL_HEADERS_3_1
+	default "3.1.8"		if BR2_KERNEL_HEADERS_3_1
 	default "3.2"		if BR2_KERNEL_HEADERS_3_2
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.7.3.4

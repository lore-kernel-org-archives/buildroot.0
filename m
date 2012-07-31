From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 31 Jul 2012 18:13:05 -0300
Subject: [Buildroot] [PATCH 01/11] kernel-headers: bump 3.4.x stable version
Message-ID: <1343769195-25220-1-git-send-email-gustavo@zacarias.com.ar>
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
index 514d299..96dd129 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -68,6 +68,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.1.10"	if BR2_KERNEL_HEADERS_3_1
 	default "3.2.24"	if BR2_KERNEL_HEADERS_3_2
 	default "3.3.8"		if BR2_KERNEL_HEADERS_3_3
-	default "3.4.6"		if BR2_KERNEL_HEADERS_3_4
+	default "3.4.7"		if BR2_KERNEL_HEADERS_3_4
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.7.8.6

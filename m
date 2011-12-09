From: Sven Neumann <s.neumann@raumfeld.com>
Date: Fri,  9 Dec 2011 22:43:14 +0100
Subject: [Buildroot] [PATCH 1/2] kernel-headers: bump 3.0.x / 3.1.x stable
	versions
Message-ID: <1323466995-21127-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 toolchain/kernel-headers/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 9e72b00..04407d1 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -57,7 +57,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.37.6"	if BR2_KERNEL_HEADERS_2_6_37
 	default "2.6.38.8"	if BR2_KERNEL_HEADERS_2_6_38
 	default "2.6.39.4"	if BR2_KERNEL_HEADERS_2_6_39
-	default "3.0.12"	if BR2_KERNEL_HEADERS_3_0
-	default "3.1.4"		if BR2_KERNEL_HEADERS_3_1
+	default "3.0.13"	if BR2_KERNEL_HEADERS_3_0
+	default "3.1.5"		if BR2_KERNEL_HEADERS_3_1
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.7.5.4

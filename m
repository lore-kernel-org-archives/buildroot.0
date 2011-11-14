From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon, 14 Nov 2011 10:07:03 +0100
Subject: [Buildroot] [PATCH 1/2] kernel-headers: update stable kernel
	version to 3.1.1
Message-ID: <1321261624-1835-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 toolchain/kernel-headers/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 701a02d..7ac5dad 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -58,6 +58,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.38.8"	if BR2_KERNEL_HEADERS_2_6_38
 	default "2.6.39.4"	if BR2_KERNEL_HEADERS_2_6_39
 	default "3.0.8"		if BR2_KERNEL_HEADERS_3_0
-	default "3.1"		if BR2_KERNEL_HEADERS_3_1
+	default "3.1.1"		if BR2_KERNEL_HEADERS_3_1
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.7.5.4

From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 8 Oct 2012 17:55:37 +0200
Subject: [Buildroot] [git commit] kernel-headers: bump 3.{0, 4, 5,
	6}.x stable versions
Message-ID: <20121008160133.7EA46997FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=21fe55eb809e429ba80617205c98d4346c5e1e53
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in                 |    8 ++++----
 ...all-fix-__packed-in-exported-kernel-head.patch} |    0
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index bfec5f1..534317e 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -67,12 +67,12 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.37.6"	if BR2_KERNEL_HEADERS_2_6_37
 	default "2.6.38.8"	if BR2_KERNEL_HEADERS_2_6_38
 	default "2.6.39.4"	if BR2_KERNEL_HEADERS_2_6_39
-	default "3.0.44"	if BR2_KERNEL_HEADERS_3_0
+	default "3.0.45"	if BR2_KERNEL_HEADERS_3_0
 	default "3.1.10"	if BR2_KERNEL_HEADERS_3_1
 	default "3.2.30"	if BR2_KERNEL_HEADERS_3_2
 	default "3.3.8"		if BR2_KERNEL_HEADERS_3_3
-	default "3.4.12"	if BR2_KERNEL_HEADERS_3_4
-	default "3.5.5"		if BR2_KERNEL_HEADERS_3_5
-	default "3.6"		if BR2_KERNEL_HEADERS_3_6
+	default "3.4.13"	if BR2_KERNEL_HEADERS_3_4
+	default "3.5.6"		if BR2_KERNEL_HEADERS_3_5
+	default "3.6.1"		if BR2_KERNEL_HEADERS_3_6
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-3.0.44-headers_install-fix-__packed-in-exported-kernel-head.patch b/toolchain/kernel-headers/linux-3.0.45-headers_install-fix-__packed-in-exported-kernel-head.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-3.0.44-headers_install-fix-__packed-in-exported-kernel-head.patch
rename to toolchain/kernel-headers/linux-3.0.45-headers_install-fix-__packed-in-exported-kernel-head.patch

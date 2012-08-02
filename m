From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:38 -0000
Subject: [Buildroot] [git commit branch/next] kernel-headers: bump 3.{0, 2, 3,
	4}.x stable versions
Message-ID: <20120802195235.DE0B096AE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bfd401200be586fc30ba6b141c5c65421d3deb66
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in                 |    8 ++++----
 ...all-fix-__packed-in-exported-kernel-head.patch} |    0
 ...umode_t.patch => linux-3.3.8-fix-umode_t.patch} |    0
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 17fe797..ea7c99c 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -64,10 +64,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.37.6"	if BR2_KERNEL_HEADERS_2_6_37
 	default "2.6.38.8"	if BR2_KERNEL_HEADERS_2_6_38
 	default "2.6.39.4"	if BR2_KERNEL_HEADERS_2_6_39
-	default "3.0.32"	if BR2_KERNEL_HEADERS_3_0
+	default "3.0.33"	if BR2_KERNEL_HEADERS_3_0
 	default "3.1.10"	if BR2_KERNEL_HEADERS_3_1
-	default "3.2.18"	if BR2_KERNEL_HEADERS_3_2
-	default "3.3.7"		if BR2_KERNEL_HEADERS_3_3
-	default "3.4"		if BR2_KERNEL_HEADERS_3_4
+	default "3.2.19"	if BR2_KERNEL_HEADERS_3_2
+	default "3.3.8"		if BR2_KERNEL_HEADERS_3_3
+	default "3.4.1"		if BR2_KERNEL_HEADERS_3_4
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-3.0.32-headers_install-fix-__packed-in-exported-kernel-head.patch b/toolchain/kernel-headers/linux-3.0.33-headers_install-fix-__packed-in-exported-kernel-head.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-3.0.32-headers_install-fix-__packed-in-exported-kernel-head.patch
rename to toolchain/kernel-headers/linux-3.0.33-headers_install-fix-__packed-in-exported-kernel-head.patch
diff --git a/toolchain/kernel-headers/linux-3.3.7-fix-umode_t.patch b/toolchain/kernel-headers/linux-3.3.8-fix-umode_t.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-3.3.7-fix-umode_t.patch
rename to toolchain/kernel-headers/linux-3.3.8-fix-umode_t.patch

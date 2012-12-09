From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 9 Dec 2012 22:00:05 +0100
Subject: [Buildroot] [git commit] kernel-headers: bump 3.{0, 2,
	4}.x stable versions
Message-ID: <20121209210013.7151F9A157@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b9b420bdd55a553c78a815f28ea98db87cd110a6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in                 |    6 +++---
 ...all-fix-__packed-in-exported-kernel-head.patch} |    0
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 6552c62..0f3ed4f 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -67,11 +67,11 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.37.6"	if BR2_KERNEL_HEADERS_2_6_37
 	default "2.6.38.8"	if BR2_KERNEL_HEADERS_2_6_38
 	default "2.6.39.4"	if BR2_KERNEL_HEADERS_2_6_39
-	default "3.0.54"	if BR2_KERNEL_HEADERS_3_0
+	default "3.0.55"	if BR2_KERNEL_HEADERS_3_0
 	default "3.1.10"	if BR2_KERNEL_HEADERS_3_1
-	default "3.2.34"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.35"	if BR2_KERNEL_HEADERS_3_2
 	default "3.3.8"		if BR2_KERNEL_HEADERS_3_3
-	default "3.4.21"	if BR2_KERNEL_HEADERS_3_4
+	default "3.4.22"	if BR2_KERNEL_HEADERS_3_4
 	default "3.5.7"		if BR2_KERNEL_HEADERS_3_5
 	default "3.6.9"		if BR2_KERNEL_HEADERS_3_6
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
diff --git a/toolchain/kernel-headers/linux-3.0.54-headers_install-fix-__packed-in-exported-kernel-head.patch b/toolchain/kernel-headers/linux-3.0.55-headers_install-fix-__packed-in-exported-kernel-head.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-3.0.54-headers_install-fix-__packed-in-exported-kernel-head.patch
rename to toolchain/kernel-headers/linux-3.0.55-headers_install-fix-__packed-in-exported-kernel-head.patch

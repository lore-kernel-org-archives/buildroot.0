From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Jul 2012 20:03:53 +0200
Subject: [Buildroot] [git commit] kernel-headers: bump 3.{0,
	4}.x stable versions
Message-ID: <20120720180404.0FB9896BBF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3096b09abdbd9ff1ecf73b0c723df9113e1787fe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/kernel-headers/Config.in                 |    4 ++--
 ...all-fix-__packed-in-exported-kernel-head.patch} |    0
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index c24dd86..63a1ae8 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -64,10 +64,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.37.6"	if BR2_KERNEL_HEADERS_2_6_37
 	default "2.6.38.8"	if BR2_KERNEL_HEADERS_2_6_38
 	default "2.6.39.4"	if BR2_KERNEL_HEADERS_2_6_39
-	default "3.0.37"	if BR2_KERNEL_HEADERS_3_0
+	default "3.0.38"	if BR2_KERNEL_HEADERS_3_0
 	default "3.1.10"	if BR2_KERNEL_HEADERS_3_1
 	default "3.2.23"	if BR2_KERNEL_HEADERS_3_2
 	default "3.3.8"		if BR2_KERNEL_HEADERS_3_3
-	default "3.4.5"		if BR2_KERNEL_HEADERS_3_4
+	default "3.4.6"		if BR2_KERNEL_HEADERS_3_4
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-3.0.37-headers_install-fix-__packed-in-exported-kernel-head.patch b/toolchain/kernel-headers/linux-3.0.38-headers_install-fix-__packed-in-exported-kernel-head.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-3.0.37-headers_install-fix-__packed-in-exported-kernel-head.patch
rename to toolchain/kernel-headers/linux-3.0.38-headers_install-fix-__packed-in-exported-kernel-head.patch

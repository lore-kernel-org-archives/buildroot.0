From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Dec 2009 21:14:46 +0100
Subject: [Buildroot] [git commit master] kernel-headers: bump 2.6.31.x /
	2.6.32.x stable versions
Message-ID: <20091214201518.54915777F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8bbb56dd9109354f66e428b4a0f83d637851643b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in                 |    4 ++--
 ...types-for-headers-exported-to-user-space.patch} |    0
 ...types-for-headers-exported-to-user-space.patch} |    0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename toolchain/kernel-headers/{linux-2.6.31.7-scsi-use-__uX-types-for-headers-exported-to-user-space.patch => linux-2.6.31.8-scsi-use-__uX-types-for-headers-exported-to-user-space.patch} (100%)
 rename toolchain/kernel-headers/{linux-2.6.32-scsi-use-__uX-types-for-headers-exported-to-user-space.patch => linux-2.6.32.1-scsi-use-__uX-types-for-headers-exported-to-user-space.patch} (100%)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index f27ddca..a327d19 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -70,7 +70,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.28.10"	if BR2_KERNEL_HEADERS_2_6_28
 	default "2.6.29.6"	if BR2_KERNEL_HEADERS_2_6_29
 	default "2.6.30.10"	if BR2_KERNEL_HEADERS_2_6_30
-	default "2.6.31.7"	if BR2_KERNEL_HEADERS_2_6_31
-	default "2.6.32"	if BR2_KERNEL_HEADERS_2_6_32
+	default "2.6.31.8"	if BR2_KERNEL_HEADERS_2_6_31
+	default "2.6.32.1"	if BR2_KERNEL_HEADERS_2_6_32
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-2.6.31.7-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.31.8-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-2.6.31.7-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
rename to toolchain/kernel-headers/linux-2.6.31.8-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
diff --git a/toolchain/kernel-headers/linux-2.6.32-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.32.1-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-2.6.32-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
rename to toolchain/kernel-headers/linux-2.6.32.1-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
-- 
1.6.3.3

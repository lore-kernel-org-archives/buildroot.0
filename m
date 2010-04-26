From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 26 Apr 2010 19:31:42 +0200
Subject: [Buildroot] [git commit master] kernel-headers: bump 2.6.32.x /
	2.6.33.x stable versions
Message-ID: <20100426173828.2B3CB20E91@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c1a2661c1956e3c14fef460be32c8dac2cca88c1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in                 |    4 ++--
 ...types-for-headers-exported-to-user-space.patch} |    0
 ...types-for-headers-exported-to-user-space.patch} |    0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename toolchain/kernel-headers/{linux-2.6.32.11-scsi-use-__uX-types-for-headers-exported-to-user-space.patch => linux-2.6.32.12-scsi-use-__uX-types-for-headers-exported-to-user-space.patch} (100%)
 rename toolchain/kernel-headers/{linux-2.6.33.2-scsi-use-__uX-types-for-headers-exported-to-user-space.patch => linux-2.6.33.3-scsi-use-__uX-types-for-headers-exported-to-user-space.patch} (100%)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 3f2d435..a3a32f1 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -63,7 +63,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.29.6"	if BR2_KERNEL_HEADERS_2_6_29
 	default "2.6.30.10"	if BR2_KERNEL_HEADERS_2_6_30
 	default "2.6.31.13"	if BR2_KERNEL_HEADERS_2_6_31
-	default "2.6.32.11"	if BR2_KERNEL_HEADERS_2_6_32
-	default "2.6.33.2"	if BR2_KERNEL_HEADERS_2_6_33
+	default "2.6.32.12"	if BR2_KERNEL_HEADERS_2_6_32
+	default "2.6.33.3"	if BR2_KERNEL_HEADERS_2_6_33
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-2.6.32.11-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.32.12-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-2.6.32.11-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
rename to toolchain/kernel-headers/linux-2.6.32.12-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
diff --git a/toolchain/kernel-headers/linux-2.6.33.2-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.33.3-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-2.6.33.2-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
rename to toolchain/kernel-headers/linux-2.6.33.3-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
-- 
1.6.3.3

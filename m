From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 16 May 2010 22:30:22 +0200
Subject: [Buildroot] [git commit master] kernel-headers: bump 2.6.32.x /
	2.6.33.x stable versions
Message-ID: <20100517052223.913F412E811@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7b7a3166634c61ec9673e591126ea99c05b1d2df
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in                 |    4 ++--
 ...types-for-headers-exported-to-user-space.patch} |    0
 ...types-for-headers-exported-to-user-space.patch} |    0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename toolchain/kernel-headers/{linux-2.6.32.12-scsi-use-__uX-types-for-headers-exported-to-user-space.patch => linux-2.6.32.13-scsi-use-__uX-types-for-headers-exported-to-user-space.patch} (100%)
 rename toolchain/kernel-headers/{linux-2.6.33.3-scsi-use-__uX-types-for-headers-exported-to-user-space.patch => linux-2.6.33.4-scsi-use-__uX-types-for-headers-exported-to-user-space.patch} (100%)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index a3a32f1..3b0c93b 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -63,7 +63,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.29.6"	if BR2_KERNEL_HEADERS_2_6_29
 	default "2.6.30.10"	if BR2_KERNEL_HEADERS_2_6_30
 	default "2.6.31.13"	if BR2_KERNEL_HEADERS_2_6_31
-	default "2.6.32.12"	if BR2_KERNEL_HEADERS_2_6_32
-	default "2.6.33.3"	if BR2_KERNEL_HEADERS_2_6_33
+	default "2.6.32.13"	if BR2_KERNEL_HEADERS_2_6_32
+	default "2.6.33.4"	if BR2_KERNEL_HEADERS_2_6_33
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-2.6.32.12-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.32.13-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-2.6.32.12-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
rename to toolchain/kernel-headers/linux-2.6.32.13-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
diff --git a/toolchain/kernel-headers/linux-2.6.33.3-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.33.4-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-2.6.33.3-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
rename to toolchain/kernel-headers/linux-2.6.33.4-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
-- 
1.6.3.3

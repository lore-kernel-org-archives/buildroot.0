From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 6 Jul 2010 08:01:00 +0200
Subject: [Buildroot] [git commit master 1/1] kernel-headers: bump 2.6.31-34
	stable versions
Message-ID: <20100706060217.287C7825FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=861dde63b23295300bed9bd55d33cfcb6f3943eb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in                 |    8 ++++----
 ...types-for-headers-exported-to-user-space.patch} |    0
 ...types-for-headers-exported-to-user-space.patch} |    0
 ...types-for-headers-exported-to-user-space.patch} |    0
 ...types-for-headers-exported-to-user-space.patch} |    0
 5 files changed, 4 insertions(+), 4 deletions(-)
 rename toolchain/kernel-headers/{linux-2.6.31.13-scsi-use-__uX-types-for-headers-exported-to-user-space.patch => linux-2.6.31.14-scsi-use-__uX-types-for-headers-exported-to-user-space.patch} (100%)
 rename toolchain/kernel-headers/{linux-2.6.32.15-scsi-use-__uX-types-for-headers-exported-to-user-space.patch => linux-2.6.32.16-scsi-use-__uX-types-for-headers-exported-to-user-space.patch} (100%)
 rename toolchain/kernel-headers/{linux-2.6.33.5-scsi-use-__uX-types-for-headers-exported-to-user-space.patch => linux-2.6.33.6-scsi-use-__uX-types-for-headers-exported-to-user-space.patch} (100%)
 rename toolchain/kernel-headers/{linux-2.6.34-scsi-use-__uX-types-for-headers-exported-to-user-space.patch => linux-2.6.34.1-scsi-use-__uX-types-for-headers-exported-to-user-space.patch} (100%)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 5e6f5cb..fea3ee4 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -65,9 +65,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.28.10"	if BR2_KERNEL_HEADERS_2_6_28
 	default "2.6.29.6"	if BR2_KERNEL_HEADERS_2_6_29
 	default "2.6.30.10"	if BR2_KERNEL_HEADERS_2_6_30
-	default "2.6.31.13"	if BR2_KERNEL_HEADERS_2_6_31
-	default "2.6.32.15"	if BR2_KERNEL_HEADERS_2_6_32
-	default "2.6.33.5"	if BR2_KERNEL_HEADERS_2_6_33
-	default "2.6.34"	if BR2_KERNEL_HEADERS_2_6_34
+	default "2.6.31.14"	if BR2_KERNEL_HEADERS_2_6_31
+	default "2.6.32.16"	if BR2_KERNEL_HEADERS_2_6_32
+	default "2.6.33.6"	if BR2_KERNEL_HEADERS_2_6_33
+	default "2.6.34.1"	if BR2_KERNEL_HEADERS_2_6_34
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-2.6.31.13-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.31.14-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-2.6.31.13-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
rename to toolchain/kernel-headers/linux-2.6.31.14-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
diff --git a/toolchain/kernel-headers/linux-2.6.32.15-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.32.16-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-2.6.32.15-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
rename to toolchain/kernel-headers/linux-2.6.32.16-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
diff --git a/toolchain/kernel-headers/linux-2.6.33.5-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.33.6-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-2.6.33.5-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
rename to toolchain/kernel-headers/linux-2.6.33.6-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
diff --git a/toolchain/kernel-headers/linux-2.6.34-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.34.1-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-2.6.34-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
rename to toolchain/kernel-headers/linux-2.6.34.1-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
-- 
1.7.1

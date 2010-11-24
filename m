From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 24 Nov 2010 15:32:17 +0100
Subject: [Buildroot] [git commit master 1/1] kernel-headers: bump 2.6.{32, 35,
	36} stable versions
Message-ID: <20101124143326.BF1648DCCA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=dc985d2cd7fd23b9ab8fc0b65940444f83eff058
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in                 |    6 +++---
 ...types-for-headers-exported-to-user-space.patch} |    0
 ...types-for-headers-exported-to-user-space.patch} |    0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename toolchain/kernel-headers/{linux-2.6.32.25-scsi-use-__uX-types-for-headers-exported-to-user-space.patch => linux-2.6.32.26-scsi-use-__uX-types-for-headers-exported-to-user-space.patch} (100%)
 rename toolchain/kernel-headers/{linux-2.6.35.8-scsi-use-__uX-types-for-headers-exported-to-user-space.patch => linux-2.6.35.9-scsi-use-__uX-types-for-headers-exported-to-user-space.patch} (100%)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index d3cde76..5bba7a6 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -59,10 +59,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "2.6.30.10"	if BR2_KERNEL_HEADERS_2_6_30
 	default "2.6.31.14"	if BR2_KERNEL_HEADERS_2_6_31
-	default "2.6.32.25"	if BR2_KERNEL_HEADERS_2_6_32
+	default "2.6.32.26"	if BR2_KERNEL_HEADERS_2_6_32
 	default "2.6.33.7"	if BR2_KERNEL_HEADERS_2_6_33
 	default "2.6.34.7"	if BR2_KERNEL_HEADERS_2_6_34
-	default "2.6.35.8"	if BR2_KERNEL_HEADERS_2_6_35
-	default "2.6.36"	if BR2_KERNEL_HEADERS_2_6_36
+	default "2.6.35.9"	if BR2_KERNEL_HEADERS_2_6_35
+	default "2.6.36.1"	if BR2_KERNEL_HEADERS_2_6_36
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-2.6.32.25-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.32.26-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-2.6.32.25-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
rename to toolchain/kernel-headers/linux-2.6.32.26-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
diff --git a/toolchain/kernel-headers/linux-2.6.35.8-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.35.9-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-2.6.35.8-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
rename to toolchain/kernel-headers/linux-2.6.35.9-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
-- 
1.7.2.2

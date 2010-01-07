From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 7 Jan 2010 21:44:40 +0100
Subject: [Buildroot] [git commit master] kernel-headers: bump 2.6.27.x /
	2.6.31.x / 2.6.32.x stable versions
Message-ID: <20100108190227.BCC75776BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6327fbc8b62a7728f9ba546eb04046c0adc4112f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in                 |    6 +++---
 ...types-for-headers-exported-to-user-space.patch} |    0
 ...types-for-headers-exported-to-user-space.patch} |    0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename toolchain/kernel-headers/{linux-2.6.31.9-scsi-use-__uX-types-for-headers-exported-to-user-space.patch => linux-2.6.31.11-scsi-use-__uX-types-for-headers-exported-to-user-space.patch} (100%)
 rename toolchain/kernel-headers/{linux-2.6.32.2-scsi-use-__uX-types-for-headers-exported-to-user-space.patch => linux-2.6.32.3-scsi-use-__uX-types-for-headers-exported-to-user-space.patch} (100%)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 94e3081..c94f25c 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -66,11 +66,11 @@ config BR2_DEFAULT_KERNEL_VERSION
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "2.6.26.8"	if BR2_KERNEL_HEADERS_2_6_26
-	default "2.6.27.42"	if BR2_KERNEL_HEADERS_2_6_27
+	default "2.6.27.43"	if BR2_KERNEL_HEADERS_2_6_27
 	default "2.6.28.10"	if BR2_KERNEL_HEADERS_2_6_28
 	default "2.6.29.6"	if BR2_KERNEL_HEADERS_2_6_29
 	default "2.6.30.10"	if BR2_KERNEL_HEADERS_2_6_30
-	default "2.6.31.9"	if BR2_KERNEL_HEADERS_2_6_31
-	default "2.6.32.2"	if BR2_KERNEL_HEADERS_2_6_32
+	default "2.6.31.11"	if BR2_KERNEL_HEADERS_2_6_31
+	default "2.6.32.3"	if BR2_KERNEL_HEADERS_2_6_32
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-2.6.31.9-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.31.11-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-2.6.31.9-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
rename to toolchain/kernel-headers/linux-2.6.31.11-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
diff --git a/toolchain/kernel-headers/linux-2.6.32.2-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.32.3-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-2.6.32.2-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
rename to toolchain/kernel-headers/linux-2.6.32.3-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
-- 
1.6.3.3

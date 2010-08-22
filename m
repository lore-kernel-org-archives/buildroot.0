From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Aug 2010 12:52:04 +0200
Subject: [Buildroot] [PATCH 12/20] Bump stable kernel headers
In-Reply-To: <cover.1282471311.git.thomas.petazzoni@free-electrons.com>
References: <cover.1282471311.git.thomas.petazzoni@free-electrons.com>
Message-ID: <6f1da8f4460ea72a84c0ba09c5deb59583b65140.1282471311.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo@zacarias.com.ar>

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/kernel-headers/Config.in                 |    8 ++++----
 ...types-for-headers-exported-to-user-space.patch} |    0
 ...types-for-headers-exported-to-user-space.patch} |    0
 ...types-for-headers-exported-to-user-space.patch} |    0
 4 files changed, 4 insertions(+), 4 deletions(-)
 rename toolchain/kernel-headers/{linux-2.6.32.16-scsi-use-__uX-types-for-headers-exported-to-user-space.patch => linux-2.6.32.18-scsi-use-__uX-types-for-headers-exported-to-user-space.patch} (100%)
 rename toolchain/kernel-headers/{linux-2.6.33.6-scsi-use-__uX-types-for-headers-exported-to-user-space.patch => linux-2.6.33.7-scsi-use-__uX-types-for-headers-exported-to-user-space.patch} (100%)
 rename toolchain/kernel-headers/{linux-2.6.34.1-scsi-use-__uX-types-for-headers-exported-to-user-space.patch => linux-2.6.34.3-scsi-use-__uX-types-for-headers-exported-to-user-space.patch} (100%)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index fea3ee4..e60595f 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -61,13 +61,13 @@ config BR2_DEFAULT_KERNEL_VERSION
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "2.6.27.47"	if BR2_KERNEL_HEADERS_2_6_27
+	default "2.6.27.50"	if BR2_KERNEL_HEADERS_2_6_27
 	default "2.6.28.10"	if BR2_KERNEL_HEADERS_2_6_28
 	default "2.6.29.6"	if BR2_KERNEL_HEADERS_2_6_29
 	default "2.6.30.10"	if BR2_KERNEL_HEADERS_2_6_30
 	default "2.6.31.14"	if BR2_KERNEL_HEADERS_2_6_31
-	default "2.6.32.16"	if BR2_KERNEL_HEADERS_2_6_32
-	default "2.6.33.6"	if BR2_KERNEL_HEADERS_2_6_33
-	default "2.6.34.1"	if BR2_KERNEL_HEADERS_2_6_34
+	default "2.6.32.18"	if BR2_KERNEL_HEADERS_2_6_32
+	default "2.6.33.7"	if BR2_KERNEL_HEADERS_2_6_33
+	default "2.6.34.3"	if BR2_KERNEL_HEADERS_2_6_34
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-2.6.32.16-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.32.18-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-2.6.32.16-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
rename to toolchain/kernel-headers/linux-2.6.32.18-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
diff --git a/toolchain/kernel-headers/linux-2.6.33.6-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.33.7-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-2.6.33.6-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
rename to toolchain/kernel-headers/linux-2.6.33.7-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
diff --git a/toolchain/kernel-headers/linux-2.6.34.1-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.34.3-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-2.6.34.1-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
rename to toolchain/kernel-headers/linux-2.6.34.3-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
-- 
1.7.0.4

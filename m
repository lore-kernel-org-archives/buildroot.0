From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 10 Jan 2011 13:13:45 +0100
Subject: [Buildroot] [git commit master 1/1] kernel-headers: bump 2.6.32.x /
	2.6.36.x stable versions
Message-ID: <20110110131222.AF9568A3BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=50f1383bfe3bf59608fe7c8994434d19bd953fa9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in                 |    4 ++--
 ...types-for-headers-exported-to-user-space.patch} |    0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename toolchain/kernel-headers/{linux-2.6.32.27-scsi-use-__uX-types-for-headers-exported-to-user-space.patch => linux-2.6.32.28-scsi-use-__uX-types-for-headers-exported-to-user-space.patch} (100%)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 6401400..fe1eeb1 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -61,11 +61,11 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "2.6.30.10"	if BR2_KERNEL_HEADERS_2_6_30
 	default "2.6.31.14"	if BR2_KERNEL_HEADERS_2_6_31
-	default "2.6.32.27"	if BR2_KERNEL_HEADERS_2_6_32
+	default "2.6.32.28"	if BR2_KERNEL_HEADERS_2_6_32
 	default "2.6.33.7"	if BR2_KERNEL_HEADERS_2_6_33
 	default "2.6.34.7"	if BR2_KERNEL_HEADERS_2_6_34
 	default "2.6.35.9"	if BR2_KERNEL_HEADERS_2_6_35
-	default "2.6.36.2"	if BR2_KERNEL_HEADERS_2_6_36
+	default "2.6.36.3"	if BR2_KERNEL_HEADERS_2_6_36
 	default "2.6.37"	if BR2_KERNEL_HEADERS_2_6_37
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-2.6.32.27-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.32.28-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-2.6.32.27-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
rename to toolchain/kernel-headers/linux-2.6.32.28-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
-- 
1.7.2.2

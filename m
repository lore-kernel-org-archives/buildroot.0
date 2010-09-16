From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 16 Sep 2010 09:56:16 +0200
Subject: [Buildroot] [git commit master 1/1] kernel-headers: bump 2.6.34.x
	version
Message-ID: <20100916075848.DC68A8A666@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=aa87ac99c56750eb5d626a785169e6df5407cc96
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in                 |    2 +-
 ...types-for-headers-exported-to-user-space.patch} |    0
 2 files changed, 1 insertions(+), 1 deletions(-)
 rename toolchain/kernel-headers/{linux-2.6.34.6-scsi-use-__uX-types-for-headers-exported-to-user-space.patch => linux-2.6.34.7-scsi-use-__uX-types-for-headers-exported-to-user-space.patch} (100%)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 7391d97..bee5044 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -62,7 +62,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.31.14"	if BR2_KERNEL_HEADERS_2_6_31
 	default "2.6.32.21"	if BR2_KERNEL_HEADERS_2_6_32
 	default "2.6.33.7"	if BR2_KERNEL_HEADERS_2_6_33
-	default "2.6.34.6"	if BR2_KERNEL_HEADERS_2_6_34
+	default "2.6.34.7"	if BR2_KERNEL_HEADERS_2_6_34
 	default "2.6.35.4"	if BR2_KERNEL_HEADERS_2_6_35
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-2.6.34.6-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.34.7-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-2.6.34.6-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
rename to toolchain/kernel-headers/linux-2.6.34.7-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
-- 
1.7.1

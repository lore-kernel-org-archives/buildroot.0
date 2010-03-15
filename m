From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 15 Mar 2010 21:18:56 +0100
Subject: [Buildroot] [git commit master] kernel-headers: bump 2.6.32.x /
	2.6.33.x versions
Message-ID: <20100315202036.DC864776E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9c60dfa06d0a1c0c6c38b8a6157db9d538904db4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in                 |    4 ++--
 ...types-for-headers-exported-to-user-space.patch} |    0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename toolchain/kernel-headers/{linux-2.6.32.9-scsi-use-__uX-types-for-headers-exported-to-user-space.patch => linux-2.6.32.10-scsi-use-__uX-types-for-headers-exported-to-user-space.patch} (100%)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 3df93b9..a0f7aec 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -64,7 +64,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.29.6"	if BR2_KERNEL_HEADERS_2_6_29
 	default "2.6.30.10"	if BR2_KERNEL_HEADERS_2_6_30
 	default "2.6.31.12"	if BR2_KERNEL_HEADERS_2_6_31
-	default "2.6.32.9"	if BR2_KERNEL_HEADERS_2_6_32
-	default "2.6.33"	if BR2_KERNEL_HEADERS_2_6_33
+	default "2.6.32.10"	if BR2_KERNEL_HEADERS_2_6_32
+	default "2.6.33.1"	if BR2_KERNEL_HEADERS_2_6_33
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-2.6.32.9-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.32.10-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-2.6.32.9-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
rename to toolchain/kernel-headers/linux-2.6.32.10-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
-- 
1.6.3.3

From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 24 Feb 2010 20:22:25 +0100
Subject: [Buildroot] [git commit master] kernel-headers: bump 2.6.32.x
	version
Message-ID: <20100224192406.11C0A77698@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3c7e344c1bbbca111420a466069cec40de7eb8c0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in                 |    2 +-
 ...types-for-headers-exported-to-user-space.patch} |    0
 2 files changed, 1 insertions(+), 1 deletions(-)
 rename toolchain/kernel-headers/{linux-2.6.32.8-scsi-use-__uX-types-for-headers-exported-to-user-space.patch => linux-2.6.32.9-scsi-use-__uX-types-for-headers-exported-to-user-space.patch} (100%)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index a0e21a8..2c1c8e2 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -71,6 +71,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.29.6"	if BR2_KERNEL_HEADERS_2_6_29
 	default "2.6.30.10"	if BR2_KERNEL_HEADERS_2_6_30
 	default "2.6.31.12"	if BR2_KERNEL_HEADERS_2_6_31
-	default "2.6.32.8"	if BR2_KERNEL_HEADERS_2_6_32
+	default "2.6.32.9"	if BR2_KERNEL_HEADERS_2_6_32
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-2.6.32.8-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.32.9-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-2.6.32.8-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
rename to toolchain/kernel-headers/linux-2.6.32.9-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
-- 
1.6.3.3

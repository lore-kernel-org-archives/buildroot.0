From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Oct 2010 09:08:08 +0200
Subject: [Buildroot] [git commit master 1/1] kernel-headers: bump 2.6.32.x
	stable version
Message-ID: <20101004071613.A09DE8B8B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=edb15260e9b15d9944804dfa5ef70b94abefc44f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in                 |    2 +-
 ...types-for-headers-exported-to-user-space.patch} |    0
 2 files changed, 1 insertions(+), 1 deletions(-)
 rename toolchain/kernel-headers/{linux-2.6.32.23-scsi-use-__uX-types-for-headers-exported-to-user-space.patch => linux-2.6.32.24-scsi-use-__uX-types-for-headers-exported-to-user-space.patch} (100%)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index bfe6afb..fa79578 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -60,7 +60,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.29.6"	if BR2_KERNEL_HEADERS_2_6_29
 	default "2.6.30.10"	if BR2_KERNEL_HEADERS_2_6_30
 	default "2.6.31.14"	if BR2_KERNEL_HEADERS_2_6_31
-	default "2.6.32.23"	if BR2_KERNEL_HEADERS_2_6_32
+	default "2.6.32.24"	if BR2_KERNEL_HEADERS_2_6_32
 	default "2.6.33.7"	if BR2_KERNEL_HEADERS_2_6_33
 	default "2.6.34.7"	if BR2_KERNEL_HEADERS_2_6_34
 	default "2.6.35.6"	if BR2_KERNEL_HEADERS_2_6_35
diff --git a/toolchain/kernel-headers/linux-2.6.32.23-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.32.24-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-2.6.32.23-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
rename to toolchain/kernel-headers/linux-2.6.32.24-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
-- 
1.7.1

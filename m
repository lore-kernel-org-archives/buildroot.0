From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 10 Jan 2011 22:24:43 +0100
Subject: [Buildroot] [git commit master 1/1] kernel-headers: bump 2.6.34.x
	stable version
Message-ID: <20110110213102.37DEB8A389@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3209c12ffea696072ecebc703f858112992fae7a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in                 |    2 +-
 ...types-for-headers-exported-to-user-space.patch} |    0
 2 files changed, 1 insertions(+), 1 deletions(-)
 rename toolchain/kernel-headers/{linux-2.6.34.7-scsi-use-__uX-types-for-headers-exported-to-user-space.patch => linux-2.6.34.8-scsi-use-__uX-types-for-headers-exported-to-user-space.patch} (100%)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 69c5c18..dc39a24 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -54,7 +54,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "2.6.32.28"	if BR2_KERNEL_HEADERS_2_6_32
 	default "2.6.33.7"	if BR2_KERNEL_HEADERS_2_6_33
-	default "2.6.34.7"	if BR2_KERNEL_HEADERS_2_6_34
+	default "2.6.34.8"	if BR2_KERNEL_HEADERS_2_6_34
 	default "2.6.35.9"	if BR2_KERNEL_HEADERS_2_6_35
 	default "2.6.36.3"	if BR2_KERNEL_HEADERS_2_6_36
 	default "2.6.37"	if BR2_KERNEL_HEADERS_2_6_37
diff --git a/toolchain/kernel-headers/linux-2.6.34.7-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.34.8-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-2.6.34.7-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
rename to toolchain/kernel-headers/linux-2.6.34.8-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
-- 
1.7.2.2

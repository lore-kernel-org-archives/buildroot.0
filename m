From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 8 Feb 2011 15:44:22 +0100
Subject: [Buildroot] [git commit master 1/1] kernel-headers: bump 2.6.35.x
	longterm version
Message-ID: <20110208144444.535CE8F3B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9df325814b22bff50b2aa7f6f1005ac14dcce2fe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in                 |    2 +-
 ...types-for-headers-exported-to-user-space.patch} |    0
 2 files changed, 1 insertions(+), 1 deletions(-)
 rename toolchain/kernel-headers/{linux-2.6.35.10-scsi-use-__uX-types-for-headers-exported-to-user-space.patch => linux-2.6.35.11-scsi-use-__uX-types-for-headers-exported-to-user-space.patch} (100%)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 6710098..47892ea 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -45,7 +45,7 @@ config BR2_DEFAULT_KERNEL_VERSION
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "2.6.34.8"	if BR2_KERNEL_HEADERS_2_6_34
-	default "2.6.35.10"	if BR2_KERNEL_HEADERS_2_6_35
+	default "2.6.35.11"	if BR2_KERNEL_HEADERS_2_6_35
 	default "2.6.36.3"	if BR2_KERNEL_HEADERS_2_6_36
 	default "2.6.37"	if BR2_KERNEL_HEADERS_2_6_37
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
diff --git a/toolchain/kernel-headers/linux-2.6.35.10-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.35.11-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-2.6.35.10-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
rename to toolchain/kernel-headers/linux-2.6.35.11-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
-- 
1.7.3.4

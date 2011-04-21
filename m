From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 21 Apr 2011 11:52:33 +0200
Subject: [Buildroot] [git commit] toolchain: bump 2.6.35 kernel headers to
	2.6.35.12
Message-ID: <20110421095712.2871682908@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=36449d1f2aaf67cf377d0b7eb49840b10cbec903
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in                 |    2 +-
 ...types-for-headers-exported-to-user-space.patch} |    0
 2 files changed, 1 insertions(+), 1 deletions(-)
 rename toolchain/kernel-headers/{linux-2.6.35.11-scsi-use-__uX-types-for-headers-exported-to-user-space.patch => linux-2.6.35.12-scsi-use-__uX-types-for-headers-exported-to-user-space.patch} (100%)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 92798d8..68151d0 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -43,7 +43,7 @@ config BR2_DEFAULT_KERNEL_VERSION
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "2.6.35.11"	if BR2_KERNEL_HEADERS_2_6_35
+	default "2.6.35.12"	if BR2_KERNEL_HEADERS_2_6_35
 	default "2.6.36.4"	if BR2_KERNEL_HEADERS_2_6_36
 	default "2.6.37.6"	if BR2_KERNEL_HEADERS_2_6_37
 	default "2.6.38.3"	if BR2_KERNEL_HEADERS_2_6_38
diff --git a/toolchain/kernel-headers/linux-2.6.35.11-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.35.12-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-2.6.35.11-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
rename to toolchain/kernel-headers/linux-2.6.35.12-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
-- 
1.7.3.4

From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 5 Oct 2009 20:50:27 +0200
Subject: [Buildroot] [git commit master] kernel-headers: bump 2.6.27/30/31
	stable versions
Message-ID: <20091005185054.57D5077768@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8323cd9b87785958b4ca538cca3c72be5bea2984
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in                 |    6 +++---
 ...delay.patch => linux-2.6.30.9-mips-delay.patch} |    0
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename toolchain/kernel-headers/{linux-2.6.30.8-mips-delay.patch => linux-2.6.30.9-mips-delay.patch} (100%)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 4652a77..1141d88 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -53,10 +53,10 @@ config BR2_KERNEL_HEADERS_RT
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "2.6.26.8"	if BR2_KERNEL_HEADERS_2_6_26
-	default "2.6.27.35"	if BR2_KERNEL_HEADERS_2_6_27
+	default "2.6.27.36"	if BR2_KERNEL_HEADERS_2_6_27
 	default "2.6.28.10"	if BR2_KERNEL_HEADERS_2_6_28
 	default "2.6.29.6"	if BR2_KERNEL_HEADERS_2_6_29
-	default "2.6.30.8"	if BR2_KERNEL_HEADERS_2_6_30
-	default "2.6.31.1"	if BR2_KERNEL_HEADERS_2_6_31
+	default "2.6.30.9"	if BR2_KERNEL_HEADERS_2_6_30
+	default "2.6.31.2"	if BR2_KERNEL_HEADERS_2_6_31
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 
diff --git a/toolchain/kernel-headers/linux-2.6.30.8-mips-delay.patch b/toolchain/kernel-headers/linux-2.6.30.9-mips-delay.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-2.6.30.8-mips-delay.patch
rename to toolchain/kernel-headers/linux-2.6.30.9-mips-delay.patch
-- 
1.6.3.3

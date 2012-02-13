From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 14 Feb 2012 00:13:09 +0100
Subject: [Buildroot] [git commit] kernel-headers: bump 3.0.x / 3.2.x stable
	versions
Message-ID: <20120214075235.C512E90A9D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=74c7b15a90c78098ca170757b11b8068e2d46d52
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in                 |    4 ++--
 ...all-fix-__packed-in-exported-kernel-head.patch} |    0
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 3c4b3db..86d6c32 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -60,8 +60,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.37.6"	if BR2_KERNEL_HEADERS_2_6_37
 	default "2.6.38.8"	if BR2_KERNEL_HEADERS_2_6_38
 	default "2.6.39.4"	if BR2_KERNEL_HEADERS_2_6_39
-	default "3.0.19"	if BR2_KERNEL_HEADERS_3_0
+	default "3.0.21"	if BR2_KERNEL_HEADERS_3_0
 	default "3.1.10"	if BR2_KERNEL_HEADERS_3_1
-	default "3.2.5"		if BR2_KERNEL_HEADERS_3_2
+	default "3.2.6"		if BR2_KERNEL_HEADERS_3_2
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-3.0.19-headers_install-fix-__packed-in-exported-kernel-head.patch b/toolchain/kernel-headers/linux-3.0.21-headers_install-fix-__packed-in-exported-kernel-head.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-3.0.19-headers_install-fix-__packed-in-exported-kernel-head.patch
rename to toolchain/kernel-headers/linux-3.0.21-headers_install-fix-__packed-in-exported-kernel-head.patch

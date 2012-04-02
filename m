From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 2 Apr 2012 23:46:55 +0200
Subject: [Buildroot] [git commit] kernel-headers: bump 3.{0, 2,
	3}.x stable versions
Message-ID: <20120402221227.6702E969E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e1443db85bc7dc2a863c4bbfdf6fe777f390ad70
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in                 |    6 +++---
 ...all-fix-__packed-in-exported-kernel-head.patch} |    0
 ...umode_t.patch => linux-3.3.1-fix-umode_t.patch} |    0
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 0b029ad..2cdd3e3 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -63,9 +63,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.37.6"	if BR2_KERNEL_HEADERS_2_6_37
 	default "2.6.38.8"	if BR2_KERNEL_HEADERS_2_6_38
 	default "2.6.39.4"	if BR2_KERNEL_HEADERS_2_6_39
-	default "3.0.26"	if BR2_KERNEL_HEADERS_3_0
+	default "3.0.27"	if BR2_KERNEL_HEADERS_3_0
 	default "3.1.10"	if BR2_KERNEL_HEADERS_3_1
-	default "3.2.13"	if BR2_KERNEL_HEADERS_3_2
-	default "3.3"		if BR2_KERNEL_HEADERS_3_3
+	default "3.2.14"	if BR2_KERNEL_HEADERS_3_2
+	default "3.3.1"		if BR2_KERNEL_HEADERS_3_3
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-3.0.26-headers_install-fix-__packed-in-exported-kernel-head.patch b/toolchain/kernel-headers/linux-3.0.27-headers_install-fix-__packed-in-exported-kernel-head.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-3.0.26-headers_install-fix-__packed-in-exported-kernel-head.patch
rename to toolchain/kernel-headers/linux-3.0.27-headers_install-fix-__packed-in-exported-kernel-head.patch
diff --git a/toolchain/kernel-headers/linux-3.3-fix-umode_t.patch b/toolchain/kernel-headers/linux-3.3.1-fix-umode_t.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-3.3-fix-umode_t.patch
rename to toolchain/kernel-headers/linux-3.3.1-fix-umode_t.patch

From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Nov 2011 13:14:46 +0100
Subject: [Buildroot] [git commit] kernel-headers: bump 3.0.x stable version
Message-ID: <20111114121533.6333A8F533@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e9668efcd2a3e6520a717326756748a3b3354739
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in                 |    2 +-
 ...all-fix-__packed-in-exported-kernel-head.patch} |    0
 2 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 7ac5dad..334e241 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -57,7 +57,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.37.6"	if BR2_KERNEL_HEADERS_2_6_37
 	default "2.6.38.8"	if BR2_KERNEL_HEADERS_2_6_38
 	default "2.6.39.4"	if BR2_KERNEL_HEADERS_2_6_39
-	default "3.0.8"		if BR2_KERNEL_HEADERS_3_0
+	default "3.0.9"		if BR2_KERNEL_HEADERS_3_0
 	default "3.1.1"		if BR2_KERNEL_HEADERS_3_1
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-3.0.8-headers_install-fix-__packed-in-exported-kernel-head.patch b/toolchain/kernel-headers/linux-3.0.9-headers_install-fix-__packed-in-exported-kernel-head.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-3.0.8-headers_install-fix-__packed-in-exported-kernel-head.patch
rename to toolchain/kernel-headers/linux-3.0.9-headers_install-fix-__packed-in-exported-kernel-head.patch

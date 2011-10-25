From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 25 Oct 2011 12:38:16 +0200
Subject: [Buildroot] [git commit] kernel-headers: bump 3.0.x stable version
Message-ID: <20111025103845.8777A8F08B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=28eeaba8eaa217b7b39175a132b26c7803f2a8bd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in                 |    2 +-
 ...all-fix-__packed-in-exported-kernel-head.patch} |    0
 2 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 8be9186..701a02d 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -57,7 +57,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.37.6"	if BR2_KERNEL_HEADERS_2_6_37
 	default "2.6.38.8"	if BR2_KERNEL_HEADERS_2_6_38
 	default "2.6.39.4"	if BR2_KERNEL_HEADERS_2_6_39
-	default "3.0.7"		if BR2_KERNEL_HEADERS_3_0
+	default "3.0.8"		if BR2_KERNEL_HEADERS_3_0
 	default "3.1"		if BR2_KERNEL_HEADERS_3_1
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-3.0.7-headers_install-fix-__packed-in-exported-kernel-head.patch b/toolchain/kernel-headers/linux-3.0.8-headers_install-fix-__packed-in-exported-kernel-head.patch
similarity index 100%
rename from toolchain/kernel-headers/linux-3.0.7-headers_install-fix-__packed-in-exported-kernel-head.patch
rename to toolchain/kernel-headers/linux-3.0.8-headers_install-fix-__packed-in-exported-kernel-head.patch

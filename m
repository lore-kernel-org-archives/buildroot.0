From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 3 Jul 2009 07:19:31 +0200
Subject: [Buildroot] [git commit] kernel-headers: bump 2.6.27.x / 2.6.29.x /
	2.6.30.x stable versions
Message-ID: <20090703052025.9540B77803@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8ae604912bbe506e617d12bf8db3db9cb04d14ab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 8a98d35..13acecc 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -49,9 +49,9 @@ config BR2_KERNEL_HEADERS_RT
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "2.6.26.8"	if BR2_KERNEL_HEADERS_2_6_26
-	default "2.6.27.25"	if BR2_KERNEL_HEADERS_2_6_27
+	default "2.6.27.26"	if BR2_KERNEL_HEADERS_2_6_27
 	default "2.6.28.10"	if BR2_KERNEL_HEADERS_2_6_28
-	default "2.6.29.5"	if BR2_KERNEL_HEADERS_2_6_29
-	default "2.6.30"	if BR2_KERNEL_HEADERS_2_6_30
+	default "2.6.29.6"	if BR2_KERNEL_HEADERS_2_6_29
+	default "2.6.30.1"	if BR2_KERNEL_HEADERS_2_6_30
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 
-- 
1.6.3.3

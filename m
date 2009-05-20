From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 20 May 2009 12:15:54 +0200
Subject: [Buildroot] [git commit] kernel-headers: bump 2.6.27 / 2.6.29
	versions
Message-ID: <20090520101609.7509A7785F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c9faf999f4c5809cc0aa80d1bd3702c61fd8c0c1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 2b8b2f2..cde510e 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -60,8 +60,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.24.7"	if BR2_KERNEL_HEADERS_2_6_24
 	default "2.6.25.19"	if BR2_KERNEL_HEADERS_2_6_25
 	default "2.6.26.8"	if BR2_KERNEL_HEADERS_2_6_26
-	default "2.6.27.23"	if BR2_KERNEL_HEADERS_2_6_27
+	default "2.6.27.24"	if BR2_KERNEL_HEADERS_2_6_27
 	default "2.6.28.10"	if BR2_KERNEL_HEADERS_2_6_28
-	default "2.6.29.3"	if BR2_KERNEL_HEADERS_2_6_29
+	default "2.6.29.4"	if BR2_KERNEL_HEADERS_2_6_29
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 
-- 
1.6.0.6

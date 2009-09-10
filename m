From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 10 Sep 2009 10:32:45 +0200
Subject: [Buildroot] [git commit master] kernel-headers: bump 2.6.27.x
	stable version
Message-ID: <20090910083412.C22D0761AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=cd411d0d9c3c580e29cbcf607d71d3acd20b0db6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 2768190..5ebea10 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -53,7 +53,7 @@ config BR2_KERNEL_HEADERS_RT
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "2.6.26.8"	if BR2_KERNEL_HEADERS_2_6_26
-	default "2.6.27.32"	if BR2_KERNEL_HEADERS_2_6_27
+	default "2.6.27.33"	if BR2_KERNEL_HEADERS_2_6_27
 	default "2.6.28.10"	if BR2_KERNEL_HEADERS_2_6_28
 	default "2.6.29.6"	if BR2_KERNEL_HEADERS_2_6_29
 	default "2.6.30.6"	if BR2_KERNEL_HEADERS_2_6_30
-- 
1.6.3.3

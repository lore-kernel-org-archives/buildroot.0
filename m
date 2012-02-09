From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 9 Feb 2012 08:51:36 +0100
Subject: [Buildroot] [git commit] kernel-headers: bump 3.2.x stable version
Message-ID: <20120209075320.D168E90A47@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2987a6fef5b2d5cd136217ecd806eb1fcc7168bf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index eda3fa9..3c4b3db 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -62,6 +62,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.39.4"	if BR2_KERNEL_HEADERS_2_6_39
 	default "3.0.19"	if BR2_KERNEL_HEADERS_3_0
 	default "3.1.10"	if BR2_KERNEL_HEADERS_3_1
-	default "3.2.4"		if BR2_KERNEL_HEADERS_3_2
+	default "3.2.5"		if BR2_KERNEL_HEADERS_3_2
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION

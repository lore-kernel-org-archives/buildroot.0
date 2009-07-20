From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 20 Jul 2009 09:14:13 +0200
Subject: [Buildroot] [git commit] kernel-headers: bump 2.6.27 / 2.6.30
	stable versions
Message-ID: <20090720071806.C51DE777F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a2e93a0ab6ee1340405aa9c1fb9e8b3fa9b98f9d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 13acecc..f1103f2 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -49,9 +49,9 @@ config BR2_KERNEL_HEADERS_RT
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "2.6.26.8"	if BR2_KERNEL_HEADERS_2_6_26
-	default "2.6.27.26"	if BR2_KERNEL_HEADERS_2_6_27
+	default "2.6.27.27"	if BR2_KERNEL_HEADERS_2_6_27
 	default "2.6.28.10"	if BR2_KERNEL_HEADERS_2_6_28
 	default "2.6.29.6"	if BR2_KERNEL_HEADERS_2_6_29
-	default "2.6.30.1"	if BR2_KERNEL_HEADERS_2_6_30
+	default "2.6.30.2"	if BR2_KERNEL_HEADERS_2_6_30
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 
-- 
1.6.3.3

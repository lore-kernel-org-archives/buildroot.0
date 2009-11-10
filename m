From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 10 Nov 2009 08:37:36 +0100
Subject: [Buildroot] [git commit master] kernel-headers: bump
	2.6.27.x/2.6.31.x stable versions
Message-ID: <20091110073818.F0A99777DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d88b812d7696e374639c7aaa2ecb21b998c142e0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 07f9f4d..42173f1 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -62,10 +62,10 @@ config BR2_DEFAULT_KERNEL_VERSION
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "2.6.26.8"	if BR2_KERNEL_HEADERS_2_6_26
-	default "2.6.27.38"	if BR2_KERNEL_HEADERS_2_6_27
+	default "2.6.27.39"	if BR2_KERNEL_HEADERS_2_6_27
 	default "2.6.28.10"	if BR2_KERNEL_HEADERS_2_6_28
 	default "2.6.29.6"	if BR2_KERNEL_HEADERS_2_6_29
 	default "2.6.30.9"	if BR2_KERNEL_HEADERS_2_6_30
-	default "2.6.31.5"	if BR2_KERNEL_HEADERS_2_6_31
+	default "2.6.31.6"	if BR2_KERNEL_HEADERS_2_6_31
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.6.3.3

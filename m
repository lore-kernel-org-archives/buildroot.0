From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 18 Feb 2011 13:23:43 +0100
Subject: [Buildroot] [git commit master 1/1] kernel-headers: bump 2.6.36.x /
	2.6.37.x stable versions
Message-ID: <20110218124123.EBEE18F5E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=76081846730b541a2bab8e95fb79160a68801fba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 47892ea..8a8c6fa 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -46,7 +46,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "2.6.34.8"	if BR2_KERNEL_HEADERS_2_6_34
 	default "2.6.35.11"	if BR2_KERNEL_HEADERS_2_6_35
-	default "2.6.36.3"	if BR2_KERNEL_HEADERS_2_6_36
-	default "2.6.37"	if BR2_KERNEL_HEADERS_2_6_37
+	default "2.6.36.4"	if BR2_KERNEL_HEADERS_2_6_36
+	default "2.6.37.1"	if BR2_KERNEL_HEADERS_2_6_37
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.7.3.4

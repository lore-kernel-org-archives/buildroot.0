From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 24 Mar 2011 13:11:52 +0100
Subject: [Buildroot] [git commit master 1/1] kernel-headers: bump 2.6.37.x /
	2.6.38.x stable versions
Message-ID: <20110325061247.43E3F81958@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=24c7a24797ca7cb230da09cc7f2789206bea7a60
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 3bb7470..85093a1 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -45,7 +45,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "2.6.35.11"	if BR2_KERNEL_HEADERS_2_6_35
 	default "2.6.36.4"	if BR2_KERNEL_HEADERS_2_6_36
-	default "2.6.37.4"	if BR2_KERNEL_HEADERS_2_6_37
-	default "2.6.38"	if BR2_KERNEL_HEADERS_2_6_38
+	default "2.6.37.5"	if BR2_KERNEL_HEADERS_2_6_37
+	default "2.6.38.1"	if BR2_KERNEL_HEADERS_2_6_38
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.7.3.4

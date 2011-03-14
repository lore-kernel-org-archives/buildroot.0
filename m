From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 15 Mar 2011 00:02:55 +0100
Subject: [Buildroot] [git commit master 1/1] kernel-headers: bump 2.6.37.x
	stable version
Message-ID: <20110314230312.902508FFE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=05e9c80832cc035efe3c52da9263b094803dc876
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index da9f3ff..7149836 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -47,6 +47,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.34.8"	if BR2_KERNEL_HEADERS_2_6_34
 	default "2.6.35.11"	if BR2_KERNEL_HEADERS_2_6_35
 	default "2.6.36.4"	if BR2_KERNEL_HEADERS_2_6_36
-	default "2.6.37.3"	if BR2_KERNEL_HEADERS_2_6_37
+	default "2.6.37.4"	if BR2_KERNEL_HEADERS_2_6_37
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.7.3.4

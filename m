From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 30 Mar 2011 20:51:48 +0200
Subject: [Buildroot] [git commit master 1/1] kernel-headers: bump 2.6.37.x /
	2.6.38.x stable versions
Message-ID: <20110330185518.AFDDA81D41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=10f9ef7081d9d99c2910361c9089774ab03dc0f7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 85093a1..1da6d53 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -45,7 +45,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "2.6.35.11"	if BR2_KERNEL_HEADERS_2_6_35
 	default "2.6.36.4"	if BR2_KERNEL_HEADERS_2_6_36
-	default "2.6.37.5"	if BR2_KERNEL_HEADERS_2_6_37
-	default "2.6.38.1"	if BR2_KERNEL_HEADERS_2_6_38
+	default "2.6.37.6"	if BR2_KERNEL_HEADERS_2_6_37
+	default "2.6.38.2"	if BR2_KERNEL_HEADERS_2_6_38
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.7.3.4

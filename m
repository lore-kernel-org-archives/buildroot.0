From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 17 Jun 2009 14:03:52 +0200
Subject: [Buildroot] [git commit] kernel-headers: bump 2.6.29.x version
Message-ID: <20090617120452.15A157780C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0a5039dfafe9c931395939862bc2fddd33e4dd65
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 34836cb..8a98d35 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -51,7 +51,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.26.8"	if BR2_KERNEL_HEADERS_2_6_26
 	default "2.6.27.25"	if BR2_KERNEL_HEADERS_2_6_27
 	default "2.6.28.10"	if BR2_KERNEL_HEADERS_2_6_28
-	default "2.6.29.4"	if BR2_KERNEL_HEADERS_2_6_29
+	default "2.6.29.5"	if BR2_KERNEL_HEADERS_2_6_29
 	default "2.6.30"	if BR2_KERNEL_HEADERS_2_6_30
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 
-- 
1.6.0.6

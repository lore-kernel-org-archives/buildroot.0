From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 18 Jan 2012 19:15:13 +0100
Subject: [Buildroot] [git commit] kernel-headers: bump 3.1.x stable version
Message-ID: <20120118181527.80D688FFFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2e913392dfbef405ecc194bf5f47803e17629045
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index cf2ac4e..36bb719 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -61,7 +61,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.38.8"	if BR2_KERNEL_HEADERS_2_6_38
 	default "2.6.39.4"	if BR2_KERNEL_HEADERS_2_6_39
 	default "3.0.17"	if BR2_KERNEL_HEADERS_3_0
-	default "3.1.9"		if BR2_KERNEL_HEADERS_3_1
+	default "3.1.10"	if BR2_KERNEL_HEADERS_3_1
 	default "3.2.1"		if BR2_KERNEL_HEADERS_3_2
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION

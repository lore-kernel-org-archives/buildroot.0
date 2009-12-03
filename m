From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 3 Dec 2009 19:05:34 +0100
Subject: [Buildroot] [git commit master] kernel-headers: fix 2.6.32 typo
Message-ID: <20091203180600.42E7F777B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=edee1d78ab38f51844df256615146d522ace6425
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Thanks to Joachim Pihl for noticing.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 19f0ae8..a0feea2 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -71,6 +71,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.29.6"	if BR2_KERNEL_HEADERS_2_6_29
 	default "2.6.30.9"	if BR2_KERNEL_HEADERS_2_6_30
 	default "2.6.31.6"	if BR2_KERNEL_HEADERS_2_6_31
-	default "2.6.32"	if BR2_KERNEL_HEADERS_2_6_31
+	default "2.6.32"	if BR2_KERNEL_HEADERS_2_6_32
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.6.3.3

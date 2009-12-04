From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 4 Dec 2009 14:25:08 +0100
Subject: [Buildroot] [git commit master] kernel-headers: bump 2.6.30.x
	version
Message-ID: <20091204132632.80FCD777F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1d49de8116e449b459296c1edf14130e5b992fba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index a0feea2..2677409 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -69,7 +69,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.27.39"	if BR2_KERNEL_HEADERS_2_6_27
 	default "2.6.28.10"	if BR2_KERNEL_HEADERS_2_6_28
 	default "2.6.29.6"	if BR2_KERNEL_HEADERS_2_6_29
-	default "2.6.30.9"	if BR2_KERNEL_HEADERS_2_6_30
+	default "2.6.30.10"	if BR2_KERNEL_HEADERS_2_6_30
 	default "2.6.31.6"	if BR2_KERNEL_HEADERS_2_6_31
 	default "2.6.32"	if BR2_KERNEL_HEADERS_2_6_32
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
-- 
1.6.3.3

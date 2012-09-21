From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 21 Sep 2012 09:59:36 +0200
Subject: [Buildroot] [git commit] kernel-headers: bump 3.2.x stable version
Message-ID: <20120921093726.037949968E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ae5dfe556a8dd4eccd7e7785230036ef7ddbd253
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 1f06e2b..4059074 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -65,7 +65,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.39.4"	if BR2_KERNEL_HEADERS_2_6_39
 	default "3.0.43"	if BR2_KERNEL_HEADERS_3_0
 	default "3.1.10"	if BR2_KERNEL_HEADERS_3_1
-	default "3.2.29"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.30"	if BR2_KERNEL_HEADERS_3_2
 	default "3.3.8"		if BR2_KERNEL_HEADERS_3_3
 	default "3.4.11"	if BR2_KERNEL_HEADERS_3_4
 	default "3.5.4"		if BR2_KERNEL_HEADERS_3_5

From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 25 Sep 2009 10:01:19 +0200
Subject: [Buildroot] [git commit master] kernel-headers: bump 2.6.27/30/31
	stable versions
Message-ID: <20090925091643.0B1DE77755@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0d7e586a9f8ab07b8c48dccef2870527beebf84a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index d277d82..4652a77 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -53,10 +53,10 @@ config BR2_KERNEL_HEADERS_RT
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "2.6.26.8"	if BR2_KERNEL_HEADERS_2_6_26
-	default "2.6.27.34"	if BR2_KERNEL_HEADERS_2_6_27
+	default "2.6.27.35"	if BR2_KERNEL_HEADERS_2_6_27
 	default "2.6.28.10"	if BR2_KERNEL_HEADERS_2_6_28
 	default "2.6.29.6"	if BR2_KERNEL_HEADERS_2_6_29
-	default "2.6.30.7"	if BR2_KERNEL_HEADERS_2_6_30
-	default "2.6.31"	if BR2_KERNEL_HEADERS_2_6_31
+	default "2.6.30.8"	if BR2_KERNEL_HEADERS_2_6_30
+	default "2.6.31.1"	if BR2_KERNEL_HEADERS_2_6_31
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 
-- 
1.6.3.3

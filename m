From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 16 Jun 2009 12:38:45 +0200
Subject: [Buildroot] [git commit] kernel-headers: bump 2.6.27.x version
Message-ID: <20090617114410.F0941776EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=40a5691f8fe5c2c17c5010ef36d7963cfe46325c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 9fd0903..34836cb 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -49,7 +49,7 @@ config BR2_KERNEL_HEADERS_RT
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "2.6.26.8"	if BR2_KERNEL_HEADERS_2_6_26
-	default "2.6.27.24"	if BR2_KERNEL_HEADERS_2_6_27
+	default "2.6.27.25"	if BR2_KERNEL_HEADERS_2_6_27
 	default "2.6.28.10"	if BR2_KERNEL_HEADERS_2_6_28
 	default "2.6.29.4"	if BR2_KERNEL_HEADERS_2_6_29
 	default "2.6.30"	if BR2_KERNEL_HEADERS_2_6_30
-- 
1.6.0.6

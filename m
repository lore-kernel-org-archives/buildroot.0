From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 25 Jul 2009 21:08:55 +0200
Subject: [Buildroot] [git commit] kernel-headers: bump 2.6.30.x stable
	version
Message-ID: <20090725191956.9BA5D77806@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=48abfcf5f0d935ca502c2ffcff392387c5153908
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index f1103f2..2a0e793 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -52,6 +52,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.27.27"	if BR2_KERNEL_HEADERS_2_6_27
 	default "2.6.28.10"	if BR2_KERNEL_HEADERS_2_6_28
 	default "2.6.29.6"	if BR2_KERNEL_HEADERS_2_6_29
-	default "2.6.30.2"	if BR2_KERNEL_HEADERS_2_6_30
+	default "2.6.30.3"	if BR2_KERNEL_HEADERS_2_6_30
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 
-- 
1.6.3.3

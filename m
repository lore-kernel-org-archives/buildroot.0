From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 21 May 2012 17:16:58 +0200
Subject: [Buildroot] [git commit] kernel-headers: bump 3.2.x stable version
Message-ID: <20120521151746.3EBB896D26@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fce8d0765a1b84b838f1807213724805e13985c2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index d8602f1..cd83270 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -65,7 +65,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.39.4"	if BR2_KERNEL_HEADERS_2_6_39
 	default "3.0.31"	if BR2_KERNEL_HEADERS_3_0
 	default "3.1.10"	if BR2_KERNEL_HEADERS_3_1
-	default "3.2.17"	if BR2_KERNEL_HEADERS_3_2
+	default "3.2.18"	if BR2_KERNEL_HEADERS_3_2
 	default "3.3.6"		if BR2_KERNEL_HEADERS_3_3
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION

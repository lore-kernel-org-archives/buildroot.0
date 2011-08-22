From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 22 Aug 2011 13:35:55 +0200
Subject: [Buildroot] [git commit] kernel-headers: bump 3.0.x stable version
Message-ID: <20110822113809.56C4B8CA5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1f2c67fe1b9ddcbc6f20ab8cea19b13d40c35d4e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 116b862..161a647 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -54,6 +54,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.37.6"	if BR2_KERNEL_HEADERS_2_6_37
 	default "2.6.38.8"	if BR2_KERNEL_HEADERS_2_6_38
 	default "2.6.39.4"	if BR2_KERNEL_HEADERS_2_6_39
-	default "3.0.1"		if BR2_KERNEL_HEADERS_3_0
+	default "3.0.3"		if BR2_KERNEL_HEADERS_3_0
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.7.3.4

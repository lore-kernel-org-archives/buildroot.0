From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 26 Jun 2011 09:12:52 +0200
Subject: [Buildroot] [git commit] kernel-headers: bump 2.6.39.x stable
	version
Message-ID: <20110626071724.3E97988E22@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b72b806f364a49688c478d849b6da6d01f47fbcf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 4c551a2..2a5cf5c 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -50,6 +50,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.36.4"	if BR2_KERNEL_HEADERS_2_6_36
 	default "2.6.37.6"	if BR2_KERNEL_HEADERS_2_6_37
 	default "2.6.38.8"	if BR2_KERNEL_HEADERS_2_6_38
-	default "2.6.39.1"	if BR2_KERNEL_HEADERS_2_6_39
+	default "2.6.39.2"	if BR2_KERNEL_HEADERS_2_6_39
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.7.3.4

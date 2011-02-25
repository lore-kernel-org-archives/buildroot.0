From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 25 Feb 2011 12:00:37 +0100
Subject: [Buildroot] [git commit master 1/1] kernel-headers: bump 2.6.37.x
	stable version
Message-ID: <20110225110122.A6C318F75A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=afba8bc930f1e242915b03722afb997535fa702e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 8a8c6fa..087549f 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -47,6 +47,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.34.8"	if BR2_KERNEL_HEADERS_2_6_34
 	default "2.6.35.11"	if BR2_KERNEL_HEADERS_2_6_35
 	default "2.6.36.4"	if BR2_KERNEL_HEADERS_2_6_36
-	default "2.6.37.1"	if BR2_KERNEL_HEADERS_2_6_37
+	default "2.6.37.2"	if BR2_KERNEL_HEADERS_2_6_37
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.7.3.4

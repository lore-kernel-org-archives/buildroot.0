From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 12 Oct 2009 19:46:23 +0200
Subject: [Buildroot] [git commit master] kernel-headers: bump 2.6.31 stable
	version
Message-ID: <20091012174655.5129D77772@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d360c612168dffa71033ba4a3a57d3df5753a87c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Daniel Mack <daniel@caiaq.de>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 1141d88..a704402 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -57,6 +57,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.28.10"	if BR2_KERNEL_HEADERS_2_6_28
 	default "2.6.29.6"	if BR2_KERNEL_HEADERS_2_6_29
 	default "2.6.30.9"	if BR2_KERNEL_HEADERS_2_6_30
-	default "2.6.31.2"	if BR2_KERNEL_HEADERS_2_6_31
+	default "2.6.31.3"	if BR2_KERNEL_HEADERS_2_6_31
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 
-- 
1.6.3.3

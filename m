From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 9 Jun 2011 12:26:28 +0200
Subject: [Buildroot] [git commit] kernel-headers: bump 2.6.38.x version
Message-ID: <20110609105206.38DAD85AA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d72dc424c0c76574640eb2eb7985e6af0c1a9441
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index d60cea0..6bf73cd 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -46,6 +46,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.35.13"	if BR2_KERNEL_HEADERS_2_6_35
 	default "2.6.36.4"	if BR2_KERNEL_HEADERS_2_6_36
 	default "2.6.37.6"	if BR2_KERNEL_HEADERS_2_6_37
-	default "2.6.38.7"	if BR2_KERNEL_HEADERS_2_6_38
+	default "2.6.38.8"	if BR2_KERNEL_HEADERS_2_6_38
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.7.3.4

From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 19 Apr 2011 22:46:04 +0200
Subject: [Buildroot] [git commit] kernel-headers: bump 2.6.38.x stable
	version
Message-ID: <20110419204735.1099B826CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a29731c4c3441b33f3eb8b75f580039c8285ffed
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 1da6d53..92798d8 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -46,6 +46,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.35.11"	if BR2_KERNEL_HEADERS_2_6_35
 	default "2.6.36.4"	if BR2_KERNEL_HEADERS_2_6_36
 	default "2.6.37.6"	if BR2_KERNEL_HEADERS_2_6_37
-	default "2.6.38.2"	if BR2_KERNEL_HEADERS_2_6_38
+	default "2.6.38.3"	if BR2_KERNEL_HEADERS_2_6_38
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
1.7.3.4

From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 25 Oct 2010 13:33:16 +0200
Subject: [Buildroot] [git commit master 1/1] kernel-headers: Fix 2.6.36
	kernel version in menuconfig string
Message-ID: <20101025113342.939D48D413@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=afb68b753e428e7e6baae3aa631c20d8b8bce56a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index ccbe2b0..ef35827 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -39,7 +39,7 @@ choice
 		bool "Linux 2.6.35.x kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_6_36
-		bool "Linux 2.6.35.x kernel headers"
+		bool "Linux 2.6.36.x kernel headers"
 
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Linux 2.6 (manually specified version)"
-- 
1.7.1

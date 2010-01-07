From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 7 Jan 2010 21:44:40 +0100
Subject: [Buildroot] [git commit master] kernel-headers: default to 2.6.32.x
Message-ID: <20100108190227.0C936776BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=64c5a7132532d6163d6f088fc7a547e8a19ef4ba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 5e07e7d..94e3081 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -6,7 +6,7 @@ comment "Kernel Header Options"
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_2_6_31
+	default BR2_KERNEL_HEADERS_2_6_32
 
 	help
 	  Select the version of kernel header files you wish to use.
-- 
1.6.3.3

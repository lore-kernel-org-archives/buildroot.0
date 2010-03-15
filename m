From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 15 Mar 2010 15:14:56 +0100
Subject: [Buildroot] [git commit master] kernel-headers: default to 2.6.33
Message-ID: <20100315141647.6768A7764D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ad4e0c152d799f368e24dc3602b887d805ec72a1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 15cdd4e..f2844ed 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -6,7 +6,7 @@ comment "Kernel Header Options"
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_2_6_32
+	default BR2_KERNEL_HEADERS_2_6_33
 
 	help
 	  Select the version of kernel header files you wish to use.
-- 
1.6.3.3

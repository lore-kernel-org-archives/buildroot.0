From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 25 Oct 2010 14:26:15 +0300
Subject: [Buildroot] [PATCH] Fix 2.6.36 kernel version in menuconfig string
Message-ID: <20101025112615.12023.17661.stgit@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
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

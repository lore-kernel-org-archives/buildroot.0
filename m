From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Mar 2013 16:18:09 +0100
Subject: [Buildroot] [PATCH] Mark AArch64 as a 64 bits architecture
Message-ID: <1363619889-8342-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/Config.in b/arch/Config.in
index 472b10c..795f24f 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -25,6 +25,7 @@ config BR2_armeb
 
 config BR2_aarch64
 	bool "AArch64"
+	select BR2_ARCH_IS_64
 	help
 	  Aarch64 is a 64-bit architecture developed by ARM Holdings.
 	  http://www.arm.com/products/processors/instruction-set-architectures/armv8-architecture.php
-- 
1.7.9.5

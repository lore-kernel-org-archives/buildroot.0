From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  7 Dec 2020 21:48:19 +0100
Subject: [Buildroot] [PATCH 3/5]
 toolchain/toolchain-external/toolchain-external-bootlin: regenerate for
 riscv32 toolchain
In-Reply-To: <20201207204821.3588178-1-romain.naour@gmail.com>
References: <20201207204821.3588178-1-romain.naour@gmail.com>
Message-ID: <20201207204821.3588178-3-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/849510531

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../toolchain-external-bootlin/Config.in.options                 | 1 -
 1 file changed, 1 deletion(-)

diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
index 3c94ae1535..be9c204193 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
@@ -3331,7 +3331,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV32_ILP32D_GLIBC_BLEEDING_EDGE
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
 	  Bootlin toolchain for the riscv32-ilp32d architecture,
 	  using the glibc C library. This is a bleeding-edge version,
-- 
2.25.4

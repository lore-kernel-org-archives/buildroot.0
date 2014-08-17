From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Aug 2014 21:29:53 +0200
Subject: [Buildroot] [PATCH 14/24 v5] arch/bfin: always has atomic ops
In-Reply-To: <cover.1408303753.git.yann.morin.1998@free.fr>
References: <cover.1408303753.git.yann.morin.1998@free.fr>
Message-ID: <636e1cb70f85e4f9153a777920cf57f3ddd1ca81.1408303753.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Anton Kolesov <Anton.Kolesov@synopsys.com>
---
 arch/Config.in.bfin | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/Config.in.bfin b/arch/Config.in.bfin
index 415fc89..0783969 100644
--- a/arch/Config.in.bfin
+++ b/arch/Config.in.bfin
@@ -68,6 +68,9 @@ config BR2_ARCH
 config BR2_ENDIAN
 	default "LITTLE"
 
+config BR2_ARCH_HAS_ATOMICS
+	default y
+
 config BR2_GCC_TARGET_CPU
 	default bf606		if BR2_bf606
 	default bf607		if BR2_bf607
-- 
1.9.1

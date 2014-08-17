From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Aug 2014 21:29:52 +0200
Subject: [Buildroot] [PATCH 13/24 v5] arch/avr32: always has atomic ops
In-Reply-To: <cover.1408303753.git.yann.morin.1998@free.fr>
References: <cover.1408303753.git.yann.morin.1998@free.fr>
Message-ID: <971878f01388e9efe0fc6a8bdf2a353bf8b1cf83.1408303753.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Anton Kolesov <Anton.Kolesov@synopsys.com>
---
 arch/Config.in.avr32 | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/Config.in.avr32 b/arch/Config.in.avr32
index 8429589..fc1f4f6 100644
--- a/arch/Config.in.avr32
+++ b/arch/Config.in.avr32
@@ -6,3 +6,6 @@ config BR2_ENDIAN
 
 config BR2_GCC_TARGET_ARCH
 	default "ap"
+
+config BR2_ARCH_HAS_ATOMICS
+	default y
-- 
1.9.1

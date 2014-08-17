From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Aug 2014 21:30:00 +0200
Subject: [Buildroot] [PATCH 21/24 v5] arch/sparc: always has atomic ops
In-Reply-To: <cover.1408303753.git.yann.morin.1998@free.fr>
References: <cover.1408303753.git.yann.morin.1998@free.fr>
Message-ID: <923f492bf4f30be440211053c6560103919c1783.1408303753.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Anton Kolesov <Anton.Kolesov@synopsys.com>
---
 arch/Config.in.sparc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/Config.in.sparc b/arch/Config.in.sparc
index 21e83f7..657c825 100644
--- a/arch/Config.in.sparc
+++ b/arch/Config.in.sparc
@@ -23,6 +23,9 @@ config BR2_ARCH
 config BR2_ENDIAN
 	default "BIG"
 
+config BR2_ARCH_HAS_ATOMICS
+	default y
+
 config BR2_GCC_TARGET_TUNE
 	default "v8"		if BR2_sparc_v8
 
-- 
1.9.1

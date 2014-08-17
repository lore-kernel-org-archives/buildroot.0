From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Aug 2014 21:30:02 +0200
Subject: [Buildroot] [PATCH 23/24 v5] arch/xtensa: always has atomic ops
In-Reply-To: <cover.1408303753.git.yann.morin.1998@free.fr>
References: <cover.1408303753.git.yann.morin.1998@free.fr>
Message-ID: <6615b9a2afd022196540d678da37992c3d847f03.1408303753.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Anton Kolesov <Anton.Kolesov@synopsys.com>
---
 arch/Config.in.xtensa | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/Config.in.xtensa b/arch/Config.in.xtensa
index 60c03f5..ff71e0b 100644
--- a/arch/Config.in.xtensa
+++ b/arch/Config.in.xtensa
@@ -35,3 +35,6 @@ config BR2_XTENSA_OVERLAY_DIR
 
 config BR2_ARCH
 	default "xtensa"	if BR2_xtensa
+
+config BR2_ARCH_HAS_ATOMICS
+	default y
-- 
1.9.1

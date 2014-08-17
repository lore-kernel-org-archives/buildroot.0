From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Aug 2014 21:29:55 +0200
Subject: [Buildroot] [PATCH 16/24 v5] arch/microblaze: always has atomic ops
In-Reply-To: <cover.1408303753.git.yann.morin.1998@free.fr>
References: <cover.1408303753.git.yann.morin.1998@free.fr>
Message-ID: <67869addff104d195007f34ba404ae61857428bf.1408303753.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Anton Kolesov <Anton.Kolesov@synopsys.com>
---
 arch/Config.in.microblaze | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/Config.in.microblaze b/arch/Config.in.microblaze
index 2d4c1fe..7c21dfc 100644
--- a/arch/Config.in.microblaze
+++ b/arch/Config.in.microblaze
@@ -9,3 +9,6 @@ config BR2_ENDIAN
 config BR2_microblaze
 	bool
 	default y if BR2_microblazeel || BR2_microblazebe
+
+config BR2_ARCH_HAS_ATOMICS
+	default y
-- 
1.9.1

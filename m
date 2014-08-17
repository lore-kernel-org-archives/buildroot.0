From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Aug 2014 14:49:10 +0200
Subject: [Buildroot] [PATCH 18/24 v4] arch/nios2: always has atomic ops
In-Reply-To: <cover.1408279142.git.yann.morin.1998@free.fr>
References: <cover.1408279142.git.yann.morin.1998@free.fr>
Message-ID: <78cbcc3f5a037c29c14a0e47c87802f2238e50b5.1408279142.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Anton Kolesov <Anton.Kolesov@synopsys.com>
---
 arch/Config.in.nios2 | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/Config.in.nios2 b/arch/Config.in.nios2
index ed63898..7807769 100644
--- a/arch/Config.in.nios2
+++ b/arch/Config.in.nios2
@@ -3,3 +3,6 @@ config BR2_ARCH
 
 config BR2_ENDIAN
 	default "LITTLE"
+
+config BR2_ARCH_HAS_ATOMICS
+	default y
-- 
1.9.1

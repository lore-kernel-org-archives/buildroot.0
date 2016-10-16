From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sun, 16 Oct 2016 18:05:18 +0100
Subject: [Buildroot] [PATCH 3/7] MIPS: add optional MSA support for M5100
	core
In-Reply-To: <20161016170522.36074-1-Vincent.Riera@imgtec.com>
References: <20161016170522.36074-1-Vincent.Riera@imgtec.com>
Message-ID: <20161016170522.36074-3-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 arch/Config.in.mips | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index fb9053c..b7bb48c 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -59,6 +59,7 @@ config BR2_mips_m5100
 	bool "M5100"
 	depends on !BR2_ARCH_IS_64
 	select BR2_MIPS_CPU_MIPS32R5
+	select BR2_MIPS_CPU_MAYBE_HAS_MSA
 config BR2_mips_m5101
 	bool "M5101"
 	depends on !BR2_ARCH_IS_64
-- 
2.10.0

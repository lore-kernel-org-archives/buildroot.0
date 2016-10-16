From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sun, 16 Oct 2016 18:05:20 +0100
Subject: [Buildroot] [PATCH 5/7] MIPS: add optional MSA support for P5600
	core
In-Reply-To: <20161016170522.36074-1-Vincent.Riera@imgtec.com>
References: <20161016170522.36074-1-Vincent.Riera@imgtec.com>
Message-ID: <20161016170522.36074-5-Vincent.Riera@imgtec.com>
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
index 4122365..4b41412 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -69,6 +69,7 @@ config BR2_mips_p5600
 	bool "P5600"
 	depends on !BR2_ARCH_IS_64
 	select BR2_MIPS_CPU_MIPS32R5
+	select BR2_MIPS_CPU_MAYBE_HAS_MSA
 config BR2_mips_64
 	bool "Generic MIPS64"
 	depends on BR2_ARCH_IS_64
-- 
2.10.0

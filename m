From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sun, 16 Oct 2016 18:05:22 +0100
Subject: [Buildroot] [PATCH 7/7] MIPS: add optional MSA support for P6600
	core
In-Reply-To: <20161016170522.36074-1-Vincent.Riera@imgtec.com>
References: <20161016170522.36074-1-Vincent.Riera@imgtec.com>
Message-ID: <20161016170522.36074-7-Vincent.Riera@imgtec.com>
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
index 4c92c09..51f46df 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -95,6 +95,7 @@ config BR2_mips_p6600
 	bool "P6600"
 	depends on BR2_ARCH_IS_64
 	select BR2_MIPS_CPU_MIPS64R6
+	select BR2_MIPS_CPU_MAYBE_HAS_MSA
 endchoice
 
 
-- 
2.10.0

From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 9 Nov 2016 16:16:58 +0000
Subject: [Buildroot] [PATCH v3 2/2] ci20_defconfig: use XBurst CPU
In-Reply-To: <20161109161658.53527-1-Vincent.Riera@imgtec.com>
References: <20161109161658.53527-1-Vincent.Riera@imgtec.com>
Message-ID: <20161109161658.53527-2-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v1 -> v3:
 - None.
---
 configs/ci20_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/ci20_defconfig b/configs/ci20_defconfig
index bd30cbd..ecf3007 100644
--- a/configs/ci20_defconfig
+++ b/configs/ci20_defconfig
@@ -1,6 +1,6 @@
 # architecture
 BR2_mipsel=y
-BR2_mips_32r2=y
+BR2_mips_xburst=y
 # BR2_MIPS_SOFT_FLOAT is not set
 
 # Linux headers same as kernel, a 3.18 series
-- 
2.10.1

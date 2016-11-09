From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 21:36:45 +0100
Subject: [Buildroot] [git commit] ci20_defconfig: use XBurst CPU
Message-ID: <20161109203706.0B4F081664@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ab26ce601f46abdc72cfceb3c752d92b67146b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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

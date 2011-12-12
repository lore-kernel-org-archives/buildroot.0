From: Xianghua Xiao <xiaoxianghua@gmail.com>
Date: Mon, 12 Dec 2011 17:09:05 -0600
Subject: [Buildroot] [PATCH 1/1]
	Auto-disable-gcc-version-unsupported-on-ppc-and-cortex
Message-ID: <CAP7cwts3gZuwD+ngkMHBo7eck8Hyg9vgKFAm_ZGBJOKyOEG6FQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

resend---

Signed-off-by: xxiao <xxiao@fosiao.com>
---
 toolchain/gcc/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index dbcbbd3..08b0058 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -15,7 +15,7 @@ choice
               bool "gcc 4.2.2-avr32-2.1.5"

        config BR2_GCC_VERSION_4_3_X
-               depends on !BR2_avr32 && !BR2_sparc_sparchfleon &&
!BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon &&
!BR2_sparc_sparcsfleonv8
+               depends on !BR2_avr32 && !BR2_sparc_sparchfleon &&
!BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon &&
!BR2_sparc_sparcsfleonv8 && !BR2_powerpc_e300c2 && !BR2_powerpc_e300c3
&& !BR2_powerpc_e500mc && !BR2_cortex_a8 && !BR2_cortex_a9
                bool "gcc 4.3.x"

        config BR2_GCC_VERSION_4_4_X
-- 
1.7.2.3


On Mon, Dec 12, 2011 at 5:03 PM, Xianghua Xiao <xiaoxianghua@gmail.com> wrote:
>

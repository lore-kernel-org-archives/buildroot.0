From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Dec 2015 12:25:50 +0100
Subject: [Buildroot] [PATCH 0/5 v2] arch/arm: properly handle ARM
 processors with optional VFP units (branch yem/arm-vfp-2)
In-Reply-To: <cover.1451145472.git.yann.morin.1998@free.fr>
References: <cover.1451145472.git.yann.morin.1998@free.fr>
Message-ID: <20151227122550.1995a3c1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 26 Dec 2015 17:05:42 +0100, Yann E. MORIN wrote:

> Yann E. MORIN (5):
>       arch/arm: reorder NEON option
>       arch/arm: add option to enable an optional VFP unit
>       arch/arm: only expose EABIhf when the CPU *has* a VFP unit
>       arch/arm: only expose VFP in FP strategy when the CPU *has* a VFP unit
>       toolchain/external: Arago armv7 toolchain really requires a VFPv3

Thanks, I've applied, after adding one more commit to add a help text
to the new BR2_ARM_ENABLE_VFP option.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

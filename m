From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 May 2018 19:22:43 +0200
Subject: [Buildroot] [PATCH 0/6] arch/ar: add cortex-m7,
 and cortex-M FPUs
In-Reply-To: <cover.1519589817.git.yann.morin.1998@free.fr>
References: <cover.1519589817.git.yann.morin.1998@free.fr>
Message-ID: <20180520192243.207524ca@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 25 Feb 2018 21:18:14 +0100, Yann E. MORIN wrote:

> Yann E. MORIN (6):
>       arch/arm: add cortex-m7 core
>       arch/arm: introduce generic FPU internal option
>       arch/arm: add option for FPv4 FPU
>       arch/arm: add options for FPv5 FPU
>       arch/arm: cortex-m4 may have an FPv4 FPU
>       arch/arm: cortex-m7 may have a FPv5 FPU

Entire series applied to next.

As discussed on IRC, I initially screwed up and applied PATCH 1/6 on
the master branch, so I reverted it, and applied the whole thing on the
next branch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

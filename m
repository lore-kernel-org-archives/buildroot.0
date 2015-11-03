From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 22:11:43 +0100
Subject: [Buildroot] [PATCH 0/3 v3] toolchain/external: bump Linaro ARM,
 ARMEB and AArch64 toolchains (branch yem/toolchain-linaro-2015.08)
In-Reply-To: <cover.1445903025.git.yann.morin.1998@free.fr>
References: <cover.1445903025.git.yann.morin.1998@free.fr>
Message-ID: <20151103221143.47625aac@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 27 Oct 2015 00:49:37 +0100, Yann E. MORIN wrote:

> Yann E. MORIN (3):
>       toolchain/external: bump Linaro ARM to 2015.08
>       toolchain/external: bump Linaro ARMEB to 2015.08
>       toolchain/external: bump Linaro AArch64 to 2015.08

All three applied, thanks!

On the first patch, I fixed the s/eglibc/glibc/ typo noticed by Baruch.

On the second patch, I rewrote the Config.in help text, since it was
not referring to the proper Linaro toolchain version (you copy/pasted
from the wrong place it seems).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

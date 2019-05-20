From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 May 2019 22:34:29 +0200
Subject: [Buildroot] [PATCH] arch: force syntax colouring to kconfig in
 Config.in.*
In-Reply-To: <20190503131017.30477-1-yann.morin.1998@free.fr>
References: <20190503131017.30477-1-yann.morin.1998@free.fr>
Message-ID: <20190520223429.363e9f89@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  3 May 2019 15:10:17 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> It is too sad when an editor picks up the wrong syntax...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  arch/Config.in.arc        | 3 +++
>  arch/Config.in.arm        | 3 +++
>  arch/Config.in.csky       | 3 +++
>  arch/Config.in.m68k       | 3 +++
>  arch/Config.in.microblaze | 3 +++
>  arch/Config.in.mips       | 3 +++
>  arch/Config.in.nios2      | 3 +++
>  arch/Config.in.or1k       | 3 +++
>  arch/Config.in.powerpc    | 3 +++
>  arch/Config.in.riscv      | 3 +++
>  arch/Config.in.sh         | 3 +++
>  arch/Config.in.sparc      | 3 +++
>  arch/Config.in.x86        | 3 +++
>  arch/Config.in.xtensa     | 3 +++
>  14 files changed, 42 insertions(+)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

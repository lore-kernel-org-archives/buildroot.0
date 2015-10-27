From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 27 Oct 2015 06:33:41 +0200
Subject: [Buildroot] [PATCH 1/3 v3] toolchain/external: bump Linaro ARM
 to 2015.08
In-Reply-To: <89db321b2d6e173eaa5b9c25e83be3637936edb9.1445903025.git.yann.morin.1998@free.fr>
References: <cover.1445903025.git.yann.morin.1998@free.fr>
 <89db321b2d6e173eaa5b9c25e83be3637936edb9.1445903025.git.yann.morin.1998@free.fr>
Message-ID: <20151027043341.GG2229@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Tue, Oct 27, 2015 at 12:49:39AM +0100, Yann E. MORIN wrote:
> +	help
> +	  Linaro toolchain for the ARM architecture. It uses Linaro
> +	  GCC 2015.08 (based on gcc 5.1), Linaro GDB 2015.08 (based on
> +	  GDB 7.10), eglibc 2.21, Binutils 2015.10 (based on 2.25). It

glibc most likely, not eglibc.

> +	  generates code that runs on all Cortex-A profile devices,
> +	  but tuned for the Cortex-A9. The code generated is Thumb 2,
> +	  with the hard floating point calling convention, and uses
> +	  the VFPv3-D16 FPU instructions.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Sep 2019 23:11:16 +0200
Subject: [Buildroot] [PATCH v2] boot/riscv-pk: Remove obselete bootloader
In-Reply-To: <20190923200256.29967-1-alistair.francis@wdc.com>
References: <20190923200256.29967-1-alistair.francis@wdc.com>
Message-ID: <20190928231116.1e938ccc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 23 Sep 2019 13:02:56 -0700
Alistair Francis <alistair.francis@wdc.com> wrote:

> The RISCV Proxy Kernel (AKA BBL) isn't being used by most distros so has
> very limited testing. It has been replaced by OpenSBI and been
> deprecated for awhile, so let's just remove it.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
> v2:
>  - Remove package from DEVELOPERS
>  - Add option to Config.in.legacy

I'd like to have a Acked-by from Mark Corbin on this patch. Mark ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

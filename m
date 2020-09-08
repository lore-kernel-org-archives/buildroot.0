From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 Sep 2020 09:46:22 +0200
Subject: [Buildroot] [PATCH 1/5] toolchain/buildroot: allow uclibc-ng
 for riscv
In-Reply-To: <CY4PR04MB3751360ECC39A61183D2B984E7290@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200908050744.425303-1-damien.lemoal@wdc.com>
 <20200908050744.425303-2-damien.lemoal@wdc.com>
 <20200908090405.4e7a2bcc@windsurf.hq.k.grp>
 <CY4PR04MB3751360ECC39A61183D2B984E7290@CY4PR04MB3751.namprd04.prod.outlook.com>
Message-ID: <20200908094622.7b05465c@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 8 Sep 2020 07:42:34 +0000
Damien Le Moal <Damien.LeMoal@wdc.com> wrote:

> This has been implemented already:
> 
> commit 8b1f6b2e08ed3c15484c2ca0c3f0a45125c559c1
> Author: Waldemar Brodkorb <wbx@openadk.org>
> Date:   Mon Aug 17 15:44:58 2020 +0200
> 
>     riscv64: add __riscv_flush_icache
> 
>     Always use the systemcall as uClibc-ng has no vdso support.
>     Tested with libffi and python in qemu-system-riscv64.
> 
> This is part of uclibc version 1.0.35.

My bad, I didn't follow that uClibc-ng has implemented, as I haven't
received any feedback to my e-mail. Good to know. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

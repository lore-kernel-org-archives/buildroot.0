From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 13 Jan 2021 20:11:31 +0100
Subject: [Buildroot] [PATCH] package/freescale-imx/firmware-imx: install
 the VPU firmware into a valid location
In-Reply-To: <CAOMZO5BTpG8f=weBKxE9fXtEf3PjGnvs7c979sNBNyKm576ixQ@mail.gmail.com>
References: <20210113120822.327-1-festevam@gmail.com>
 <0a7f5a1d-e930-084a-3372-3ecc736a810a@smile.fr>
 <CAOMZO5BTpG8f=weBKxE9fXtEf3PjGnvs7c979sNBNyKm576ixQ@mail.gmail.com>
Message-ID: <9fcc8d9b-eade-1a4b-66f4-e592c73ce41a@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio,

Le 13/01/2021 ? 14:29, Fabio Estevam a ?crit?:
> Hi Romain,
> 
> On Wed, Jan 13, 2021 at 10:20 AM Romain Naour <romain.naour@smile.fr> wrote:
> 
>> Ok but it add a 60sec delay when we use the mainline kernel.
> 
> Yes, not a pleasant experience.
> 
> What if we copy the VPU firmware to both locations?
> 
> /lib/firmware/
> /lib/firmware/vpu/
> 
> This way mainline kernel will fetch the VPU firmware faster and NXP
> vendor can also work.
> 

I don't see any difference between NXP vendor and mainline kernel.

See:
https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/media/platform/coda/coda-common.c?h=imx_5.4.70_2.3.0#n2889

Can you check if there is any local change applied to your kernel or a specific
configuration ?

Best regards,
Romain

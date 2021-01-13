From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 13 Jan 2021 21:02:19 +0100
Subject: [Buildroot] [PATCH] package/freescale-imx/firmware-imx: install
 the VPU firmware into a valid location
In-Reply-To: <CAOMZO5BTpG8f=weBKxE9fXtEf3PjGnvs7c979sNBNyKm576ixQ@mail.gmail.com>
References: <20210113120822.327-1-festevam@gmail.com>
 <0a7f5a1d-e930-084a-3372-3ecc736a810a@smile.fr>
 <CAOMZO5BTpG8f=weBKxE9fXtEf3PjGnvs7c979sNBNyKm576ixQ@mail.gmail.com>
Message-ID: <aeea51ae-483e-1cfc-0c5d-222aaf2d5400@gmail.com>
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

What about a simlink ?

Best regards,
Romain

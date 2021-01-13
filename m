From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 13 Jan 2021 16:21:52 -0300
Subject: [Buildroot] [PATCH] package/freescale-imx/firmware-imx: install
 the VPU firmware into a valid location
In-Reply-To: <9fcc8d9b-eade-1a4b-66f4-e592c73ce41a@gmail.com>
References: <20210113120822.327-1-festevam@gmail.com>
 <0a7f5a1d-e930-084a-3372-3ecc736a810a@smile.fr>
 <CAOMZO5BTpG8f=weBKxE9fXtEf3PjGnvs7c979sNBNyKm576ixQ@mail.gmail.com>
 <9fcc8d9b-eade-1a4b-66f4-e592c73ce41a@gmail.com>
Message-ID: <CAOMZO5CcqiUjyAtdEOa56hgK0emhaaz3h69GwNe7xL-BDGmCFw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On Wed, Jan 13, 2021 at 4:11 PM Romain Naour <romain.naour@gmail.com> wrote:

> I don't see any difference between NXP vendor and mainline kernel.
>
> See:
> https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/media/platform/coda/coda-common.c?h=imx_5.4.70_2.3.0#n2889
>
> Can you check if there is any local change applied to your kernel or a specific
> configuration ?

The NXP kernel does not use the coda driver. It uses
drivers/mxc/vpu/mxc_vpu.c instead.

Regards,

Fabio Estevam

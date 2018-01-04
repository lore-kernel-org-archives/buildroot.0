From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 4 Jan 2018 10:48:18 +0100
Subject: [Buildroot] [PATCH 02/16] imx-lib: bump to version
 imx_4.9.11_1.0.0_ga
In-Reply-To: <20180103214857.770c738f@windsurf.lan>
References: <20180103183842.10182-1-gary.bisson@boundarydevices.com>
 <20180103183842.10182-3-gary.bisson@boundarydevices.com>
 <20180103214857.770c738f@windsurf.lan>
Message-ID: <CAAMH-yvGxnAdqyRpbT4fkp85kfeegnfvcQrNYZH6d0oX9AnZqA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Jan 3, 2018 at 9:48 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Wed,  3 Jan 2018 19:38:28 +0100, Gary Bisson wrote:
>
>> -IMX_LIB_VERSION = 5.4
>> -IMX_LIB_SITE = $(FREESCALE_IMX_SITE)
>> +IMX_LIB_VERSION = rel_imx_4.9.x_1.0.0_ga
>> +IMX_LIB_SITE = https://source.codeaurora.org/external/imx/imx-lib
>
> So now, some stuff will come from FREESCALE_IMX_SITE, some stuff from
> https://source.codeaurora.org/external/imx/, and some stuff from
> github,Freescale,kernel-module-imx-gpu-viv ?

And some from github.com/codeauroraforum yes.

> Is it really that messy ? :-)

It hasn't changed that much actually:
- freescale.com repositories are moved to codeaurora
- NXPMicro Github repositories are moved to codeauroraforum
- Packages delivered as tarballs are still on FREESCALE_IMX_SITE
- All the community work is still available on github.com/freescale

If anything it is more open than before, many packages now have their
own repo on codeaurora whereas it used to be tarballs.

Regards,
Gary

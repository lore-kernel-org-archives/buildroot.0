From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Thu, 27 Dec 2018 15:39:18 +0100
Subject: [Buildroot] [PATCH 6/9] package/imx-mkimage: Bump to
 imx_4.14.62_1.0.0_beta
In-Reply-To: <20181227085624.b2xoscre4rgongha@sapphire.tkos.co.il>
References: <20181226223112.24456-1-nerv@dawncrow.de>
 <20181226223112.24456-6-nerv@dawncrow.de>
 <20181227085624.b2xoscre4rgongha@sapphire.tkos.co.il>
Message-ID: <0baa2974-e710-5017-49e7-469aa1b5fdf8@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 27.12.18 um 09:56 schrieb Baruch Siach:
>> -IMX_MKIMAGE_VERSION = rel_imx_4.9.51_8mq_ga
>> +IMX_MKIMAGE_VERSION = rel_imx_4.14.62_1.0.0_beta
> 
> Why not bump to the latest rel_imx_4.14.78_1.0.0_ga?

Hi Baruch,

Thanks for having a look!
rel_imx_4.14.62_1.0.0_beta is the version currently used in:
https://git.buildroot.net/buildroot/tree/configs/freescale_imx8mqevk_defconfig
Further I did all my testing with it and don't have access to the imx8x board for the next two weeks.
So for now I'd like to stick to that version until I and the imx8mq maintainers can test it.

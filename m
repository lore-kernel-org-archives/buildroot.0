From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Thu, 27 Dec 2018 15:39:23 +0100
Subject: [Buildroot] [PATCH 5/9] package/freescale-imx: Add
 imx-sc-firmware package
In-Reply-To: <20181227094657.64049784@windsurf>
References: <20181226223112.24456-1-nerv@dawncrow.de>
 <20181226223112.24456-5-nerv@dawncrow.de> <20181227094657.64049784@windsurf>
Message-ID: <a91e5340-d938-9d95-6d39-d47a6cab69a0@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 27.12.18 um 09:46 schrieb Thomas Petazzoni:
> So this package doesn't do anything on platforms other than
> BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X. Should the package "depends
> on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X" ?

Thanks for having a look!
If it is better to change it later I can do that. Just note there is a third variant of i.MX8 which also needs this, evalboards should be out early 2019 for it.

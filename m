From: Julien Olivain <juju@cotds.org>
Date: Tue, 10 Dec 2019 22:18:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/freescale-imx/firmware-imx:
 bump version to 8.1.1
In-Reply-To: <CADCpmyNmhhH1UYm3H57hPm2HjfsGSwo9f+zRY-Tm_G0yyEoQkg@mail.gmail.com>
References: <20191202200601.418280-1-juju@cotds.org>
 <CADCpmyNmhhH1UYm3H57hPm2HjfsGSwo9f+zRY-Tm_G0yyEoQkg@mail.gmail.com>
Message-ID: <6627ce775a5fcc6480467df7d9e265ba@cotds.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gary,

On 2019-12-10 12:16, Gary Bisson wrote:
> Hi Julien,
> 
> Le lun. 2 d?c. 2019 ? 21:06, Julien Olivain <juju@cotds.org> a ?crit :
>> 
>> This version is aligned with i.MX NXP BSP components version
>> rel_imx_4.14.98_2.0.0_ga
> 
> Why not update to latest version 8.3 [1] (4.14.98_2.1.0 BSP from last 
> July)?
> Any known issue with it?
> 
> Regards,
> Gary
> 
> [1]
> https://source.codeaurora.org/external/imx/meta-fsl-bsp-release/tree/imx/meta-bsp/recipes-bsp/firmware-imx/firmware-imx_8.3.bb?h=rel_imx_4.14.98_2.1.0

I will give the same answer I gave to Fabio [1], for
freescale_imx8mqevk_defconfig.

 From experience, aligning FSL/NXP component version altogether will
reduce the risk of unexpected behaviors. Sometimes, an update in a
firmware has its counterpart somewhere else (kernel, lib...). This is
why I'm suggesting this specific version, to stay on
rel_imx_4.14.98_2.0.0_ga.

Some time ago, all FSL components were tagged with same BSP release
name. So updating all the packages at once was easier.

Best regards,

Julien.

[1] 
http://lists.busybox.net/pipermail/buildroot/2019-December/268135.html

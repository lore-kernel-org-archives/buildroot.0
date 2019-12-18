From: Julien Olivain <juju@cotds.org>
Date: Wed, 18 Dec 2019 14:23:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/imx-sc-firmware: bump to
 version 1.2.1
In-Reply-To: <CAOMZO5D_Dh2sgweJ+0U_os-jP3igeVbO2XJmeesZTdoQDe86gA@mail.gmail.com>
References: <20191218130429.847805-1-juju@cotds.org>
 <CAOMZO5D_Dh2sgweJ+0U_os-jP3igeVbO2XJmeesZTdoQDe86gA@mail.gmail.com>
Message-ID: <94f6389ba7bd24a86cdec3e8295fddad@cotds.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio,

On 2019-12-18 14:10, Fabio Estevam wrote:
> Hi Julien,
> 
> On Wed, Dec 18, 2019 at 10:05 AM Julien Olivain <juju@cotds.org> wrote:
>> 
>> This version is aligned with i.MX NXP BSP components version
>> rel_imx_4.14.98_2.0.0_ga
>> 
>> This patch also add the hash file.
>> 
>> Signed-off-by: Julien Olivain <juju@cotds.org>
> 
> ...
>> -IMX_SC_FIRMWARE_VERSION = 1.0
>> +IMX_SC_FIRMWARE_VERSION = 1.2.1
> 
> As per the 4.14.98 BSP Release notes (Rev. L4.14.98_2.2.0, 4 November
> 2019) the imx-sc-firmware used is 1.2.2.

As per:
https://source.codeaurora.org/external/imx/meta-fsl-bsp-release/tree/imx/meta-bsp/recipes-bsp/imx-sc-firmware?h=sumo-4.14.98-2.0.0_ga

For 4.14.98_2.0.0_ga, imx-sc-firmware is 1.2.1.
imx-sc-firmware is 1.2.2 is for 4.14.98_2.2.0.

Since the rest of the components are on 4.14.98_2.0.0_ga, I would really
suggest 1.2.1.

Best regards,

Julien.

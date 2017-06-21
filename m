From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 21 Jun 2017 12:18:18 -0300
Subject: [Buildroot] [PATCH RESEND v2] imx6q-sabresd: Add a qt5
	defconfig variant
In-Reply-To: <20170621161937.1d14f804@windsurf.home>
References: <1498048346-1326-1-git-send-email-fabio.estevam@nxp.com>
 <20170621161937.1d14f804@windsurf.home>
Message-ID: <CAOMZO5DxMd6+bvVxe9Q7gAJf+=i24YAJdDSs1RFfcC1sBB2V_g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Jun 21, 2017 at 11:19 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Wed, 21 Jun 2017 09:32:26 -0300, Fabio Estevam wrote:
>
>> +BR2_PACKAGE_MESA3D=y
>> +BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV=y
>> +BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
>> +BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
>
> Just curious, why are you enabling the swrast drivers here?

Good point: actually I don't need it.

Would you like to respin it without this option?

Thanks

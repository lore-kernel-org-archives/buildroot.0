From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 24 Mar 2021 16:03:28 +0100
Subject: [Buildroot] [PATCH v2 4/5] board/freescale/common/imx: add
 support for i.MX8M Plus
In-Reply-To: <20210322091252.11392-5-stephane.viau@oss.nxp.com>
References: <20210322091252.11392-1-stephane.viau@oss.nxp.com>
 <20210322091252.11392-5-stephane.viau@oss.nxp.com>
Message-ID: <YFtUwB8Vnlc/sTsN@p1g2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stephane,

On Mon, Mar 22, 2021 at 10:12:51AM +0100, Stephane Viau wrote:
> Almost identical as i.MX8M Nano, with a couple of differences:
> - different ATF load address [1]
> - different entry point [2]
> 
> [1] https://source.denx.de/u-boot/u-boot/-/commit/e8e2703a3050feb8d2e6473d806c5277d5e3236f
> [2] https://source.denx.de/u-boot/u-boot/-/blob/v2021.04-rc4/configs/imx8mp_evk_defconfig#L14
> 
> Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>

Same thing.
Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>

Regards,
Gary

From: Fabrice Goucem <fabrice.goucem@nxp.com>
Date: Wed, 30 Oct 2019 13:43:53 +0000
Subject: [Buildroot] [PATCH 2/2] configs/freescale_imx7ulpevk: new
 defconfig
In-Reply-To: <CAOMZO5Bsrr1rnVSPAh8PuLPwNQDAKqpbwaGtS2A1uwb+kk1g3Q@mail.gmail.com>
References: <20191029170102.13482-1-fabrice.goucem@nxp.com>
 <20191029170102.13482-2-fabrice.goucem@nxp.com>
 <CAOMZO5Bsrr1rnVSPAh8PuLPwNQDAKqpbwaGtS2A1uwb+kk1g3Q@mail.gmail.com>
Message-ID: <8e87dda36d9ac7b8f130249d7a805beeb70536d8.camel@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2019-10-29 at 15:09 -0300, Fabio Estevam wrote:
> >  .gitlab-ci.yml                                |  1 +
> >  DEVELOPERS                                    |  2 +
> >  board/freescale/imx7ulpevk/readme.txt         | 65
> > +++++++++++++++++++
> >  configs/freescale_imx7ulpevk_defconfig        | 28 ++++++++
> >  package/freescale-imx/Config.in               |  8 ++-
> >  .../imx-m4-firmware/imx-m4-firmware.hash      |  1 +
> >  .../imx-m4-firmware/imx-m4-firmware.mk        | 13 +++-
> 
> The M4 firmware changes should not be part of this patch.
> 
> > +Boot the i.MX7ULP EVK board
> > +===========================
> > +
> > +To boot your newly created system (refer to the i.MX 7ULP EVK
> > Quick Start Guide [1] for guidance):
> > +- insert the SD card in the micro SD slot of the board;
> > +- put a micro USB cable into the Debug USB Port and connect using
> > a terminal
> > +  emulator at 115200 bps, 8n1;
> > +- power on the board.
> 
> You should include some instructions to tell the user how to flash
> the
> QSPI flash with the M4 SDK binary.

Thanks for your review Fabio.
I've followed your comments and resubmitted the series of patches.

Fabrice

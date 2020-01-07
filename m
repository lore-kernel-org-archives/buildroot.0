From: Jerry Huang <jerry.huang@nxp.com>
Date: Tue, 7 Jan 2020 08:11:20 +0000
Subject: [Buildroot] [EXT] Re: [PATCH v3 9/9] configs/nxp_ls1028ardb*:
 new board
In-Reply-To: <CA+h21hqX-R2ks1ACMXyS9kMFBKcgLU68Z-yoiB82fb3dvfF7WA@mail.gmail.com>
References: <20191127071720.15623-1-jerry.huang@nxp.com>
 <20191127071720.15623-9-jerry.huang@nxp.com>
 <CA+h21hqX-R2ks1ACMXyS9kMFBKcgLU68Z-yoiB82fb3dvfF7WA@mail.gmail.com>
Message-ID: <VI1PR04MB51364975EDFE241E042611CDFE3F0@VI1PR04MB5136.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Vlamidir,
sure

Best Regards
Jerry Huang

> -----Original Message-----
> From: Vladimir Oltean <olteanv@gmail.com>
> Sent: Tuesday, December 24, 2019 8:48 PM
> To: Jerry Huang <jerry.huang@nxp.com>
> Cc: buildroot at busybox.net; Michael Walle <michael@walle.cc>;
> geomatsi at gmail.com; Matthew Weber <matthew.weber@collins.com>;
> Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Subject: [EXT] Re: [Buildroot] [PATCH v3 9/9] configs/nxp_ls1028ardb*: new
> board
> 
> Caution: EXT Email
> 
> Hi Jerry,
> 
> On Wed, 27 Nov 2019 at 09:18, Changming Huang <jerry.huang@nxp.com>
> wrote:
> >
> > This is to support Freescale/NXP LS1028ARDB in Buildroot.
> > The board is setup to track the Linux at 4.19 via NXP LSDK-19.09.
> >
> > The target will build uboot and RCW binary with arm-trusted-firmware
> support.
> >
> > board/nxp/ls1028ardb/: scripts related with ls1028ardb
> > nxp_ls1028ardb-64b-emmc_defconfig: defconfig boot from emmc chip on
> board
> > nxp_ls1028ardb-64b_defconfig: defconfig boot from SD card
> > nxp_ls1028ardb-64b-xspi_defconfig: defconfig boot from FlexSPI chip on board
> >
> > Signed-off-by: Changming Huang <jerry.huang@nxp.com>
> > ---
> 
> It looks like this series has stagnated. Do you think you can repost a
> v4 with the feedback received so far?
> 
> Thanks,
> -Vladimir

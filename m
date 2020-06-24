From: Stephane Viau (OSS) <stephane.viau@oss.nxp.com>
Date: Wed, 24 Jun 2020 08:50:02 +0000
Subject: [Buildroot] [PATCH 1/3] package/freescale-imx/firmware-imx:
 install sdma firmware for i.MX8M{, M, N}
In-Reply-To: <20200622224918.0bda44c3@windsurf.home>
References: <20200615130633.19909-1-sebastien.szymanski@armadeus.com>,
 <20200622224918.0bda44c3@windsurf.home>
Message-ID: <DB8PR04MB575507EABBF0E715F8E2B919A7950@DB8PR04MB5755.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

<snip>
>
>Overall, I think firmware-imx.mk is pretty messy in terms of how it
>describes what needs to be installed for each platform. It probably
>needs to be cleaned up to allow to more easily support more
>capabilities on more platforms.

Hi Thomas, Sebastien,

As mentioned to Yann in another thread [1], I'm working on a patch that will hopefully clear things up (currently in review internally).

BR,
Stephane.

[1] http://lists.busybox.net/pipermail/buildroot/2020-June/284032.html

>
>Thanks!
>
>Thomas
>--
>Thomas Petazzoni, CTO, Bootlin
>Embedded Linux and Kernel engineering
>https://bootlin.com
>_______________________________________________
>buildroot mailing list
>buildroot at busybox.net
>http://lists.busybox.net/mailman/listinfo/buildroot
>

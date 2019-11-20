From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 20 Nov 2019 10:38:57 +0100
Subject: [Buildroot] [EXT] Re: [PATCH 7/9] package/rcw: Enable IIC5_PMUX
 and CLK_OUT_PMUX for GPIO
In-Reply-To: <VI1PR04MB5136E760A49DE331036F9F8DFE4F0@VI1PR04MB5136.eurprd04.prod.outlook.com>
References: <20191120040725.32207-1-jerry.huang@nxp.com>
 <20191120040725.32207-8-jerry.huang@nxp.com>
 <20191120101451.34bd8120@windsurf.home>
 <VI1PR04MB5136E760A49DE331036F9F8DFE4F0@VI1PR04MB5136.eurprd04.prod.outlook.com>
Message-ID: <20191120103857.52d575f0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 20 Nov 2019 09:34:13 +0000
Jerry Huang <jerry.huang@nxp.com> wrote:

> > The patches modify only files in ls1028ardb/, and you apply them when the
> > board name is ls1028ardb, so basically, you could just as well apply the patches
> > unconditionally, no ?  
> I can change it to apply the patch unconfitionally.

OK, thanks. Please make sure to submit the patch to the upstream rcw
project, so that ultimately, we can drop the patches.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

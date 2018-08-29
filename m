From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Aug 2018 21:14:53 +0200
Subject: [Buildroot] [PATCH] board/freescale/imx8mqevk: remove hardware
 support section from readme
In-Reply-To: <20180829151554.8966-1-gary.bisson@boundarydevices.com>
References: <20180829151554.8966-1-gary.bisson@boundarydevices.com>
Message-ID: <20180829211453.0c67b78f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 Aug 2018 17:15:54 +0200, Gary Bisson wrote:
> At first the support for i.MX8MQ processors was minimal, hence this
> section in the readme file.
> 
> Since then, GPU support was added [1] in master and VPU in next [2].
> 
> So drop this section as it is confusing people and no one maintains it.
> 
> [1] https://git.buildroot.net/buildroot/commit/?id=84afda9c
> [2] https://git.buildroot.net/buildroot/commit/?id=82732071
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>

I've applied to master, thanks.

> Can this patch be included for 2018.08 release?
> 
> Also, would it be possible to update the release text [1] to mention
> i.MX8MQ graphics support? Something like:
> - i.MX Vivante graphics version bumped to 6.2.4.p1.2 adding support for
>   Wayland and i.MX8MQ platforms

Peter: what do you think about this? Do we change the 2018.08-rc1
release details after the fact ? Do we include this in the 2018.08
final announcement, even if it was already there in 2018.08-rc1 ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Aug 2018 23:12:30 +0200
Subject: [Buildroot] [PATCH 2/3 v3] linux: kconfig needs host-{flex,
 bison} to build the configurators
In-Reply-To: <20180814210349.GN7915@scaer>
References: <cover.1533327111.git.yann.morin.1998@free.fr>
 <c85b3d3994261356bedfa3daeaddbc4329836fe9.1533327111.git.yann.morin.1998@free.fr>
 <20180814162130.00f55418@windsurf> <20180814152743.GJ7915@scaer>
 <20180814215344.20784816@windsurf> <20180814210349.GN7915@scaer>
Message-ID: <20180814231230.7f5e2e3e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Aug 2018 23:03:49 +0200, Yann E. MORIN wrote:

> > So the system-wide bison/flex would only be used for the kconfig
> > programs built by Buildroot itself (if we move to a newer kconfig
> > version that doesn't have the pre-generated files) or by
> > Linux/U-Boot/Busybox/Barebox. Any other use of flex/bison would use
> > host-flex and host-bison. That's your proposal ?  
> 
> Yes, that is my proposal.

OK. Let's see what Arnout/Peter have to say about this. If they don't
express any opinion by Thursday, I'll go with your proposal which seems
reasonable to me.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

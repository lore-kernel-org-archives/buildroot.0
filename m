From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jan 2016 13:16:16 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <56A8ABFB.5030803@synopsys.com>
References: <20160122073021.E35B6101A27@stock.ovh.net>
 <20160122102957.10f29956@free-electrons.com>
 <56A76066.10908@synopsys.com>
 <20160126142618.7ce66276@free-electrons.com>
 <56A8ABFB.5030803@synopsys.com>
Message-ID: <20160127131616.281b5748@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Joao Pinto,

On Wed, 27 Jan 2016 11:37:31 +0000, Joao Pinto wrote:

> Just checked and apparently MPlayer 1.2.x already supports AARCH64 so I think
> the patch
> https://git.busybox.net/buildroot/commit/?id=c93805207e24df082495f4d050bc2f29f3d19dd6
> is no longer necessary.

Sorry, I don't understand. You're talking about MPlayer, which clearly
doesn't build for AArch64, and you point to a commit about sysvinit.

Could you explain ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

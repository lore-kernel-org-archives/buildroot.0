From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 May 2018 08:57:06 +0200
Subject: [Buildroot] [PATCH 1/2] modem-manager: fix test of unset
 variable in init script
In-Reply-To: <eb2e030a-c7de-60e5-b92f-4c0eb02742f1@mind.be>
References: <20180413162521.7078-1-casantos@datacom.ind.br>
 <20180413162521.7078-2-casantos@datacom.ind.br>
 <20180414180725.4964d59d@windsurf>
 <650761555.1610.1523806309320.JavaMail.zimbra@datacom.ind.br>
 <20180415201808.013e84f3@windsurf.numericable.fr>
 <20180415185828.GD21958@scaer>
 <1990213039.2807.1523823774902.JavaMail.zimbra@datacom.ind.br>
 <eb2e030a-c7de-60e5-b92f-4c0eb02742f1@mind.be>
Message-ID: <20180514085706.086830e9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 16 Apr 2018 17:53:25 +0200, Arnout Vandecappelle wrote:

> > So I will prepare a series removing the tests from the startup scripts.  
> 
>  Well, part of the position we already stated a few times in the past is that we
> should make our sysvinit scripts conform to a pattern. So I think the optimal
> approach is:
> 
> 1. Update the sysvinit scripts of one or two packages to conform to this
> pattern. Note that we have not really discussed the actual pattern, just a few
> preferences (e.g. don't test for the existence of the daemon). So it is
> important to update only one or two scripts so we can get convergence on the
> desired pattern, before updating many more packages.
> 
> 2. Document this pattern in the manual. For me, it would be sufficient to refer
> to an existing sysvinit script rather than repeating it in the manual.
> 
> 3. Update more packages.
> 
> 4. Add some support to check-package to identify common mistakes in the pattern.

Agreed on this plan.

Anybody interested in this effort ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

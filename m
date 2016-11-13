From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Nov 2016 12:11:00 +0100
Subject: [Buildroot] Enable option of nodeJS 4.1.2 in buildroot 2015.11
In-Reply-To: <20161113090038.GA3580@free.fr>
References: <CALD51P8hSabOW+SdV0Ycc46Ar4Pqn0jZuyazKhUUQcqKvsg6qA@mail.gmail.com>
 <20161111043706.nrzzr7ca5nybi2ir@tarshish>
 <20161111150017.29e032b5@free-electrons.com>
 <20161112210140.GA3700@free.fr>
 <20161113095304.3dcd95f6@free-electrons.com>
 <20161113090038.GA3580@free.fr>
Message-ID: <20161113121100.7fcdd0fd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 13 Nov 2016 10:00:39 +0100, Yann E. MORIN wrote:

> > I don't see how I could miss this. But then, why did Lijun had issues
> > selecting NodeJS, and Baruch proposal to add || BR2_ARM_CPU_HAS_VFPV3
> > solved it?  
> 
> It did _not_ solve the issue, because Lijun did not have BR2_ARM_ENABLE_VFP
> enabled, which meant he also did not have BR2_ARM_CPU_HAS_VFPV3 enabled.
> 
> Instead, he did use BR2_ARM_CPU_MAYBE_HAS_VFPV3 which is wrong.
> 
> Lijun must enable BR2_ARM_ENABLE_VFP in his config, if his CPU (cortex-a9)
> indeed has a VFP. If not, then he'll be stuck with nodejs 0.10.x and
> there is nothing we can do about that.
> 
> Nothing to investigate here on our side. 

ACK, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

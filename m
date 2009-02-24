From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 24 Feb 2009 07:14:28 +0100
Subject: [Buildroot] problem building openswan using svn-buildroot
In-Reply-To: <87hc2l2yns.fsf@macbook.be.48ers.dk>
References: <499E05A7.2070403@unix-beratung.de>
	<87bpsv6ik4.fsf@macbook.be.48ers.dk>
	<49A17E91.7060104@unix-beratung.de>
	<87y6vy5okv.fsf@macbook.be.48ers.dk>
	<20090223102825.GB31413@cbg.dyndns.org>
	<87hc2l2yns.fsf@macbook.be.48ers.dk>
Message-ID: <1235456068.24843.35.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

m?n 2009-02-23 klockan 12:14 +0100 skrev Peter Korsgaard:
> >>>>> "Steffen" == Steffen Schulz <pepe_ml@gmx.net> writes:
> 
> Hi,
> 
>  Robert> thanks for your reply.  I was beginning to get the impression
>  Robert> that nobody cares about openswan :) Is there a better
>  Robert> alternative?
>  >> 
>  >> Sorry, I don't know - Anyone else?
> 
>  Steffen> strongSwan is, to my knowledge, the only free IKEv1/IKEv2 server
>  Steffen> that is in active development and ready for productive use.
> 
>  Steffen> It's far from small though.
> 

Why not declare it as BROKEN?
I would not be surprised if someone would need it
at some point even if it has little attention at the moment.

> Ok, anyone wants to step up and support openswan/strongswan? Otherwise
> I think our users are better off if we remove the package.
> 
BR
Ulf Samuelsson

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Dec 2015 19:39:43 +0100
Subject: [Buildroot] trying to use
 https://github.com/beagleboard/linux.git with buildroot
In-Reply-To: <1450894505.3036056.475106194.467AC874@webmail.messagingengine.com>
References: <1450890296.2355509.475056490.71128E4E@webmail.messagingengine.com>
 <20151223184751.12365336@free-electrons.com>
 <1450893821.3034067.475093450.34890777@webmail.messagingengine.com>
 <1450894505.3036056.475106194.467AC874@webmail.messagingengine.com>
Message-ID: <20151223193943.21a6f0fc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Craig Swank,

On Wed, 23 Dec 2015 10:15:05 -0800, Craig Swank wrote:
> Here is my response again.  I sent one a few minutes ago but it might be
> too big because I tried attaching the build output.
> 
> > Does it work with some other kernel? 
> Yes, it works with the default kernel that is defined in
> configs/beaglebone_defconfig
> 
> > Do you have console= defined in the bootargs to the proper value?
> I tried playing around with console= a few days ago, but I didn't get it
> working with that.  I really am not sure what the correct args would be.
>  I'm going to revisit that now and see if I can find what they should be
> set to.  
> 
> I uploaded the build output to
> https://www.dropbox.com/s/nbm6r5520g0wutf/nohup.out.bz2?dl=0 

I don't see anything obviously wrong here. Unfortunately, I don't have
a BBB with me to test this right now. Maybe someone else on the list
will have this at hand.

That being said, you can still follow my Buildroot tutorial at
https://www.youtube.com/watch?v=1PfthHCfudY, where I'm doing a step by
step description of building a Buildroot configuration for the BBB.
It's not using the kernel from http://github.com/beagleboard/linux.git,
but instead the mainline Linux kernel. But it should give you another
thing to test and look at.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

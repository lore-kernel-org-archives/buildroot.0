From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Jun 2016 23:44:22 +0200
Subject: [Buildroot] [v1 1/1] uboot: Add local directory option to
	menuconfig
In-Reply-To: <20160627205746.GC3714@free.fr> (Yann E. MORIN's message of "Mon, 
 27 Jun 2016 22:57:46 +0200")
References: <1466994356-15411-1-git-send-email-Aduskett@gmail.com>
 <20160627205746.GC3714@free.fr>
Message-ID: <87twgepart.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Adam, All,
 > (Peter, Thomas, Arnout: questions for you, below.)

 > On 2016-06-26 22:25 -0400, Adam Duskett spake thusly:
 >> Just like the kernel menuconfig, this allows for a user to
 >> specify a local directory for the uboot source code.

 > I'm not sure this is a great idea... I'm not sure it was a great idea to
 > allow it for the Linux kernel either, mind you.

 > The problem with local sources is that they make the build
 > non-reproducible.

Indeed.

 >     commit 73da2ff6f718f2889e3c5024d899f8d58f502863
 >     Author: Rafal Fabich <rafal.fabich@gmail.com>
 >     Date:   Sat Feb 23 19:03:30 2013 +0100

 >         Added local directory as source of kernel code
    
 >         Add the option to use a local directory as the source for
 >         building the Linux kernel, which can be useful during
 >         kernel development.
    
 >         Signed-off-by: Rafal Fabich <rafal.fabich@gmail.com>
 >         Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 >         Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 >         Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > Peter, any reason that you applied this patch at the time?
 > Arnout, anything you remember for giving your ACK?

Sorry, I don't remember. Most likely because Arnout acked it. I have
never personally used this feature.

 > So, I would think that:
 >   1- we don't want this for U-Boot;
 >   2- we should drop it for Linux.

 > Peter, Thomas, Arnout: what do you think?

Ok from me unless somebody can explain a use case for it.

-- 
Venlig hilsen,
Peter Korsgaard 

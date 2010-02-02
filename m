From: Tony Mozi <spooflinux@hotmail.fr>
Date: Tue, 2 Feb 2010 16:01:51 +0100
Subject: [Buildroot] 'make ARCH=arm' warning, how can I correct?
In-Reply-To: <5f2b61002020620r5fcd9847ke8b12c873374cc83@mail.gmail.com>
References: <SNT129-W159AEF2E2D689BDC2F9C82B9570@phx.gbl>,
	<5f2b61002020620r5fcd9847ke8b12c873374cc83@mail.gmail.com>
Message-ID: <SNT129-W10DB011B5927021C8C0055B9570@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,
Thank you for your answer Bj?rn Forsman.

I have already make 'make menuconig', I modified
        Target Architecture (arm) --->
        Target Architecture Variant (arm922t) --->
        Target ABI (0ABI) --->
Then I make a 'make'.

I added the PATH with the correct link and export CROSS_COMPILE="arm-linux-uclibc-"
Well, I supposed that I can make 'make ARCH=arm'.
But I have these warnings and I don't know if they are important or not.

When I start the SDK, I have 'Welcome to Buildroot buildroot login:' I have not this pass. 
I want to remove it, but I don't know where?

BR

> Date: Tue, 2 Feb 2010 15:20:47 +0100
> Subject: Re: [Buildroot] 'make ARCH=arm' warning, how can I correct?
> From: bjorn.forsman at gmail.com
> To: spooflinux at hotmail.fr
> CC: buildroot at busybox.net
> 
> Hi Tony,
> 
> On 2 February 2010 14:47, Tony Mozi <spooflinux@hotmail.fr> wrote:
> > Hello all,
> > I make the cross-compilation for an ARM.
> >
> > When I make 'make ARCH=arm', I have some errors :
> >
> > <stdin>:91:1: warning: "__IGNORE_sync_file_range" redefined
> > In file included from <stdin>:2:
> > include/arm/unistd.h:444:1: warning: this is the location of the previous
> > definition
> > <stdin>:1097:2: warning: #warning syscall fadvise64 not implemented
> > <stdin>:1265:2: warning: #warning syscall migrate_pages not implemented
> > <stdin>:1321:2: warning: #warning syscall pselect6 not implemented
> > <stdin>:1325:2: warning: #warning syscall ppoll not implemented
> > <stdin>:1365:2: warning: #warning syscall epoll_pwait not implemented
> >
> > How can I correct?
> 
> Do not use 'make ARCH=arm' with Buildroot. Use 'make menuconfig' and select
> the target architecture in the menu. See 'make help' for some predefined
> configurations.
> 
> Best regards,
> Bj?rn Forsman
 		 	   		  
_________________________________________________________________
Nouveau?! Tout Windows Live d?barque dans votre t?l?phone. Voir les Windows phone
http://clk.atdmt.com/FRM/go/175819071/direct/01/
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100202/3803ff7b/attachment.htm>

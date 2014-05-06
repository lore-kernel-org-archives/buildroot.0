From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 May 2014 11:13:12 +0200
Subject: [Buildroot] [PATCHv2 00/10] musl support,
	internal and external backends
In-Reply-To: <87bnvbgw0u.fsf@dell.be.48ers.dk>
References: <1399324630-3830-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <87bnvbgw0u.fsf@dell.be.48ers.dk>
Message-ID: <20140506111312.7f2b97ea@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Tue, 06 May 2014 10:18:41 +0200, Peter Korsgaard wrote:

>  > Compared to v1:
> 
>  >  * The issue of the symbolic link for the dynamic linker noticed by
>  >    Peter is fixed. In fact, the musl Makefile can create this symbolic
>  >    link perfectly fine if we are in the good conditions.
> 
>  >  * A patch for musl support in gcc 4.9.0 has been added.
> 
>  >  * The patch for musl external toolchains has been added, and after
>  >    the suggestion from Arnout, a single Kconfig option is now used
>  >    instead of one per architecture.
> 
>  > I've built and boot tested under Qemu ARM/musl/gcc4.8 and
>  > i386/musl/gcc4.9.
> 
> Committed series, thanks.

Great, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

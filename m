From: Erik Andersen <andersen@codepoet.org>
Date: Tue, 11 Sep 2007 20:58:50 -0600
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
In-Reply-To: <000301c7f4be$e8d51230$2d03310a@atmel.com>
References: <20070911190713.A0773A614E@busybox.net>
	<000301c7f4be$e8d51230$2d03310a@atmel.com>
Message-ID: <20070912025850.GA22239@codepoet.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue Sep 11, 2007 at 11:56:56PM +0200, Ulf Samuelsson wrote:
> 
> 
> Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
> 
> 
> > Author: andersen
> > Date: 2007-09-11 12:07:12 -0700 (Tue, 11 Sep 2007)
> > New Revision: 19817
> > 
> > Log:
> > bump up a few version numbers.  kill dead 2.6.19 option.
> > accomodate powerpc64
> > 
> > 
> > Modified:
> >   trunk/buildroot/toolchain/kernel-headers/Config.in
> >   trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile
> >   trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk
> > 
> 
> 
> This patch breaks all the AT91 and AVR32 and x86 boards
> since patches are applied based on linux kernel version numbers.
> linux-2.6.22.1 should be the default option...

ok.  I was mainly adding the powerpc64 accomodation bit, since
I had a need to build that.  Since I was personally building
2.6.22.6 it seemed best to sync things up.  Sorry to break the
other platforms.  Feel free to fix it back that way it was...

 -Erik

--
Erik B. Andersen             http://codepoet-consulting.com/
--This message was written using 73% post-consumer electrons--

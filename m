From: Ulf Samuelsson <ulf@atmel.com>
Date: Sat, 14 Jul 2007 00:24:31 +0200
Subject: [Buildroot] Linux build files.
In-Reply-To: <20070713121832.GC32559@aon.at>
References: <1184260756.5175.57.camel@elrond.sweden.atmel.com>
	<20070713121832.GC32559@aon.at>
Message-ID: <1184365471.22266.14.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fre 2007-07-13 klockan 14:18 +0200 skrev Bernhard Fischer:
> On Thu, Jul 12, 2007 at 07:19:16PM +0200, Ulf Samuelsson wrote:
> >Here is the target/linux/Config.in and target/linux/Makefile.in 
> >that I use in my local buildroot from 2007-05-31.
> >(Did not test it against the latest buildroot, which obviously
> >needs to happen)
> 
> Can you show us the diff of linux26.mk, please?
> 
IIRC, It was created before linux26.mk, so there is very little common
things.
I expect that a diff would mostly delete linux26.mk and create
the Makefile.in.
Will do it anyway.



> TIA,

From: Ulf Samuelsson <ulf@atmel.com>
Date: Fri, 28 Sep 2007 23:03:31 +0200
Subject: [Buildroot] AVR32 misery
In-Reply-To: <20070928191440.GS20951@aon.at>
References: <1190938123.5322.54.camel@elrond.atmel.sweden>
	<1190956802.18129.2.camel@localhost.localdomain>
	<1190961727.5322.70.camel@elrond.atmel.sweden>
	<20070928162433.GI20951@aon.at>
	<1191005626.5322.216.camel@elrond.atmel.sweden>
	<20070928191440.GS20951@aon.at>
Message-ID: <1191013411.5322.248.camel@elrond.atmel.sweden>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fre 2007-09-28 klockan 21:14 +0200 skrev Bernhard Fischer:
> On Fri, Sep 28, 2007 at 08:53:46PM +0200, Ulf Samuelsson wrote:
>  
> >> We don't need to pass --with-gnu-ld nor --with-gnu-as. If sombody finds
> >> a different assembler or linker, then this is a consequence of something
> >> going wrong previously. The target is linux and not irix or something
> >> like that.
> >
> >Well gcc-4.1.2 doesn't find anything apparently 
> >unless you bombard it with information during configure.
> >-with-as=$(CROSS_COMPILE)as seems absolutely neccessary.
> >or ORIGINAL_AS_FOR_TARGET will be empty.
> >
> >Empty ORIGINAL_AS_FOR_TARGET is why sysroot fails.
> 
> Yea, I know. This and the fact that gcc-4.1.x is not the current release
> series, so i decided to leave it alone.
> >Still gcc-4.1.2 has problems with libtool.
> 
> 4.1 has lots of problems, and lots of problems were thusly fixed in the
> current (and upcoming) release(s). Trying to fix 4.1 it doesn't make
> sense to me, there's enough to do in current stuff that is way more
> interresting, at least IMO.

Maybe, but I do not have time to port AVR32 to gcc.
Someone else will do that in due time.
I think I should be able to get the current release to build though...

BR
Ulf

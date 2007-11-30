From: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
Date: Fri, 30 Nov 2007 13:03:12 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package:  libosip2
In-Reply-To: <1196423486.4635.19.camel@elrond.atmel.sweden>
References: <20071130102837.4DBEBA6AB6@busybox.net>
	<474FF6C3.8020107@promwad.com>
	<1196423486.4635.19.camel@elrond.atmel.sweden>
Message-ID: <1196424192.1699.3.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2007-11-30 at 12:51 +0100, Ulf Samuelsson wrote:
> fre 2007-11-30 klockan 13:40 +0200 skrev Ivan Kuten:

<cut>

> > > +if BR2_GAMES
> > > +source "package/lxdoom/Config.in"
> > > +endif
> > > +
> > >  endmenu
> 
> Mistake, trying to add Doom as well so that slipped through.
> Doom fails to compile on ARM due to packing, but I might as well 
> add it since is should compile on AVR32.
>

I had to patch the lxdldoom client a lot to make it compile on AVR32, I
think I have the patch still around here somewhere. At least I should be
able to redo it.

It will be nice to have a selection of games :)

-- 
With kind regards,
Hans-Christian Egtvedt, Applications Engineer

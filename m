From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Sun, 25 Jan 2009 22:17:16 +0100
Subject: [Buildroot] 2009.02-rc2 released
In-Reply-To: <87zlhffs9j.fsf@macbook.be.48ers.dk>
References: <3B941116898CDA489B91563DEF88F4B607F8DB@iwt-server.iwt.local>
	<1232868757.5311.170.camel@elrond.atmel.com>
	<87zlhffs9j.fsf@macbook.be.48ers.dk>
Message-ID: <1232918236.2298.9.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

s?n 2009-01-25 klockan 14:07 +0100 skrev Peter Korsgaard:
> >>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> 
>  Ulf> s?n 2009-01-25 klockan 11:28 +1100 skrev Paul Jones:
>  >> I had a go at compiling this for an ARM and I get this error:
>  >> 
>  >> 
>  >> 
>  Ulf> Noone has put a lot of effort into supporting the
>  Ulf> "generic" ARM so there is no linux configuration file available.
> 
> I don't quite see how such a config would make sense in the first
> place. ARM is far from as homogeneous as i386.
> 
>  Ulf> You have obviously selected Advanced Kernel configuration, and for
>  Ulf> that you need Qt installed, or you have to select
>  Ulf> to use "menuconfig" in the setup instead of "xconfig"
> 
> Ulf, several people (myself included) told you to default to menuconfig
> for the kernel stuff, I'm surprised that's still not the case.

If you want a simple configuration, then you don't use
the "Advanced configuration for Linux"

The advanced configuration is a selectable option.
so is the make menuconfig.
I prefer default

I wrote the Advanced configuration so that I can 
work with Linux in a manner that is flexible.

What should possible be done is to fallback to menuconfig if this fails

You want to minimize the options for the user, so I suggest
that you write a new way of configuring Linux
so you can do it the way You want.

You have NO business changing the board defaults.


BR
Ulf Samuelsson

> -- 
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

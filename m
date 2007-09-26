From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 26 Sep 2007 13:30:25 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
In-Reply-To: <87d4w5n0rt.fsf@macbook.be.48ers.dk>
References: <20070926102333.E52393004A@busybox.net>
	<87d4w5n0rt.fsf@macbook.be.48ers.dk>
Message-ID: <1190806225.4933.38.camel@elrond.atmel.sweden>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ons 2007-09-26 klockan 13:07 +0200 skrev Peter Korsgaard:
> >>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
> 
> Hi,
> 
>  ulf> +# BUG: In "OpenSuSE 10.2", dbus.h is at dbus-1.0/dbus/dbus.h
>  ulf> +# instead of at "dbus/dbus.h"
>  ulf> +# (cd /usr/include; sudo ln -s dbus-1.0/dbus dbus) 
> 
> Huh, on the build host? Why would qtopia mess around with that?

It includes <dbus/dbus.h>
Which on OpenSuSE 10.2 is at <dbus-1.0/dbus/dbus.h>

I assume this is a problem with OpenSuSE instead of qtopia.
It is there as a help for people with problem
but it does not fix it.
Have to do that manually.

BR
Ulf Samuelsson

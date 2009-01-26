From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Mon, 26 Jan 2009 23:25:16 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <87wsch3fiv.fsf@macbook.be.48ers.dk>
References: <20090126201708.B4FD677458@busybox.osuosl.org>
	<871vup6c9o.fsf@macbook.be.48ers.dk>
	<1233005042.2298.111.camel@elrond.atmel.com>
	<8763k14uz6.fsf@macbook.be.48ers.dk>
	<1233005720.2298.125.camel@elrond.atmel.com>
	<87wsch3fiv.fsf@macbook.be.48ers.dk>
Message-ID: <1233008716.2298.135.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

m?n 2009-01-26 klockan 22:48 +0100 skrev Peter Korsgaard:
> >>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> 
>  Ulf> It is documented now!
>  >> 
>  >> That doesn't make it any less of a special case.
> 
>  Ulf> You are again, not only trying to establish a default behaviour
>  Ulf> You are trying to FORCE other to accept your preferences.
> 
> Huh?
> 
> config  BR2_MAKE_XCONFIG
>         bool "make xconfig (needs QT3 headers on host)"
> 
> git grep BR2_MAKE_XCONFIG=y
> target/device/Atmel/at91rm9200df/at91rm9200df_defconfig:BR2_MAKE_XCONFIG=y
> target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_defconfig:BR2_MAKE_XCONFIG=y
> target/device/Atmel/atngw100-base/atngw100-base_defconfig:BR2_MAKE_XCONFIG=y
> target/device/Atmel/atstk1005/atstk1005_defconfig:BR2_MAKE_XCONFIG=y
> 
> I don't quite see the problem.

What is the problem then with having environment variables.

Pls come up with an alternative method to enforce
behaviour of buildroot without having to resort to
editing config files.

BR 
Ulf Samuelsson

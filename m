From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 26 Jan 2009 22:48:24 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <1233005720.2298.125.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Mon\, 26 Jan 2009 22\:35\:20 +0100")
References: <20090126201708.B4FD677458@busybox.osuosl.org>
	<871vup6c9o.fsf@macbook.be.48ers.dk>
	<1233005042.2298.111.camel@elrond.atmel.com>
	<8763k14uz6.fsf@macbook.be.48ers.dk>
	<1233005720.2298.125.camel@elrond.atmel.com>
Message-ID: <87wsch3fiv.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

 Ulf> It is documented now!
 >> 
 >> That doesn't make it any less of a special case.

 Ulf> You are again, not only trying to establish a default behaviour
 Ulf> You are trying to FORCE other to accept your preferences.

Huh?

config  BR2_MAKE_XCONFIG
        bool "make xconfig (needs QT3 headers on host)"

git grep BR2_MAKE_XCONFIG=y
target/device/Atmel/at91rm9200df/at91rm9200df_defconfig:BR2_MAKE_XCONFIG=y
target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_defconfig:BR2_MAKE_XCONFIG=y
target/device/Atmel/atngw100-base/atngw100-base_defconfig:BR2_MAKE_XCONFIG=y
target/device/Atmel/atstk1005/atstk1005_defconfig:BR2_MAKE_XCONFIG=y

I don't quite see the problem.

 Ulf> I suspect that there are others that feel the same.
 Ulf> Why can't you accept that!

People disagreed to your change to make xconfig default. So far I
haven't heard anyone else than you complaining about making menuconfig
default.

-- 
Bye, Peter Korsgaard

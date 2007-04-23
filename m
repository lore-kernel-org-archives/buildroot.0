From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 23 Apr 2007 21:02:53 +0200
Subject: [Buildroot] New version of AT91 Buildroot available
References: <1177318904.4872.67.camel@elrond.sweden.atmel.com>
	<462CFDE6.7040307@apexar.com>
Message-ID: <006001c785da$041331c0$9003960a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>
> Hi,
> 
> I'was testing de script and i got this error:
> 
> checking for iconv_open... no
> checking for libiconv_open in -liconv... no
> checking for iconv_open in -liconv... no
> configure: error: *** No iconv() implementation found in C library or 
> libiconv
> make: *** 
> [/home/dfons/buildroot_atmel/buildroot-atmel/build_arm_small/glib-2.12.9/.configured] 
> Error 1
> 
> Is it possible that uClib 0.9.28.3 doesn't have an iconv() implementation?

Exchange packages/glib with the vanilla buildroot and see if it changes.
There are some patches there from the AVR32 BSP which does not yet support 0.9.28.3

I did not build this with a lot of packages yet, since then it wont fit into the 8 MB Dataflashcards..
When I can get some time to test out the NAND flash functionality, then this problem will go away
but I do not plan to do extensive testing of more than minimal root fs functionality.


Best Regards
Ulf Samuelsson

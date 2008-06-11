From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 11 Jun 2008 19:47:29 +0200
Subject: [Buildroot] Still no answer for a contribution made in March
References: <20080611161156.33737116@crazy>
	<46a136670806110808x737929a4red33f32c593ae6e2@mail.gmail.com>
Message-ID: <006801c8cbeb$c828cf90$dfc4af0a@Glamdring>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hi Thomas,

> I would have expected Ulf to take care of your patch since he usually
> handles most of the ARM stuff.

I am short of time.
There is a lot that needs fixing,

* Use U-Boot-1.3.4 for AT91
* Migration of patches allowing buildroot to configure U-Boot.
* Update external toolchain for AVR32.
* Addition of some new devices. (AT572D940 Diopsis, SAM9RL, the AT32AP7200).

I won't be too active until August - unless it is raining.
There is also European Football Championship and Olympics that will 
interfere...
Go Zlatan go!

Best Regards
Ulf Samuelsson


I've noticed that one of the important
methods of working with free software is to be able to make the changes
directly yourself. So I would email Erik for subversion access, and drop it
in there myself. If nobody on the list seems to be actively doing things,
just do it yourself. It's not because nobody cares or nodoby is interested,
people like me only work on it in our spare time. Also, I don't know
anything about the ARM so I try to avoid making changes in areas I can't
support in the future.

Just my two cents.

John Voltz


On Wed, Jun 11, 2008 at 10:11 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hi,
>
> On March, 12th, I sent a patch adding Thumb support for the ARM
> architecture to this list:
>  http://buildroot.uclibc.org/lists/buildroot/2008-March/007427.html
>
> Two days later, no comments:
>  http://buildroot.uclibc.org/lists/buildroot/2008-March/007492.html
>
> Five days later, no comments:
>  http://buildroot.uclibc.org/lists/buildroot/2008-March/007544.html
>
> Two months later, still no comments:
>  http://buildroot.uclibc.org/lists/buildroot/2008-May/008723.html
>
> Do you actually care of contributions ?
>
> I don't assume that my patch is perfect or absolutely useful for
> everybody, but I would have at least expected some reaction from
> Buildroot maintainers saying: ?no, thank you, we don't care about this
> feature? or ?interesting feature, but your approach is flawed because of
> this and that?.
>
> FWIW, one user reported interest in such a feature:
>  http://buildroot.uclibc.org/lists/buildroot/2008-March/007495.html
>
> This absence of reaction is very frustrating for new potential
> contributors. I would like to contribute more to Buildroot, but this
> experience doesn't really encourage one in spending more time writing
> patches that will be ignored.
>
> Thanks a lot for this great project,
>
> Sincerly,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers and embedded Linux development,
> consulting, training and support.
> http://free-electrons.com
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>



--------------------------------------------------------------------------------


> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot 

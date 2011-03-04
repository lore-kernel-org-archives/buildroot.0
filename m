From: bruce bushby <bruce.bushby@gmail.com>
Date: Fri, 4 Mar 2011 23:19:57 +0000
Subject: [Buildroot] [OT?] Re: Applying custom kernel patches
In-Reply-To: <201103042359.26721.yann.morin.1998@anciens.enib.fr>
References: <AANLkTi=_dHFneTLXe3+P1-cOM2dsLsQW6f_fgbK7hSQy@mail.gmail.com>
	<4D716A17.1040008@wp.pl>
	<9AC3F0E75060224C8BBC5BA2DDC8853A1F734FA3@EXV1.corp.adtran.com>
	<201103042359.26721.yann.morin.1998@anciens.enib.fr>
Message-ID: <AANLkTinLv4s4R_Wh1bOZ2Fz4Hrsjc_Loeqdwi9HpSUAv@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm new to buildroot so probably don't understand it all yet.

From my perspective, my board is not supported, so my patches are more then
adding a "defconfig"

Perhaps: /opt/buildroot/linux/kernel-patches/<kernel
version>/<number-ordered-patch-details.patch>

would be easier then pasting patches into "make menuconfig"




On Fri, Mar 4, 2011 at 10:59 PM, Yann E. MORIN <
yann.morin.1998@anciens.enib.fr> wrote:

> All,
>
> On Friday 04 March 2011 23:45:07 ANDY KENNEDY wrote:
> > > Could someone write a HOWTO?
> > > I mean:
> > > step 0): "I have kernel.xxx.yy.zzz directory unpacked AND a set of
> > > patches (that applies correctly from kernel root) patch.00xx.patch"
> > > step 1): where should I put (link?) kernel source?,
> > > step 2): where should I put patches?.
> > > step 3): how do I inform buildroot about patches?
> >
> > It isn't that "dumbed down" but how about:
> > buildroot/docs/patches.html  <Linux kernel section>?
>
> Not sure it will answer the question, but what about:
>  http://buildroot.org/downloads/buildroot.html#board_support
>
> Regards,
> Yann E. MORIN.
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>     |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
> conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110304/b52558ce/attachment-0001.html>

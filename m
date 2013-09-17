From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Tue, 17 Sep 2013 17:17:44 +0200 (CEST)
Subject: [Buildroot] Is GPLv2 the right license for Buildroot?
In-Reply-To: <l19qcl$f47$1@ger.gmane.org>
Message-ID: <1693597603.7090134.1379431064317.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'll second that,

when we develop software for a customer building a product we educate them
on their duties WRT open-source software and what they should do to comply.
We also provide them with all the source code they need to comply.

(on a side note, some customers don't want to deal with that and just let
us push upstream all the changes to FOSS so all changes are upstream and
they don't need to provide their changes :P )

But don't overestimate that whole "provide the code" thing. There is 
very little code to provide, 99% of the code our customers use is unmodified
and their only duty is to point you to the original project's URL (that 
usually includes buildroot). The only real modification would be  if the
.config is considered derived work. But for a lot of our customers that would
be the only thing they would need to provide...

    Cordialement

    J?r?my Rosen

fight key loggers : write some perl using vim

----- Mail original -----
> On 2013-09-17, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> wrote:
> 
> > Yes, but I do believe that no company is actually complying to the
> > GPL requirements by providing the build system source code.
> 
> We do.  I wrote a shell-script that removes proprietary
> files/packages
> and bundles the resulting buildroot source tree which can then be
> used
> to build all of the open-source stuff.
> 
> Nobody's ever _requested_ the sources, but they're available.
> 
> I don't expect that anyone ever will request sources, since without
> the proprietary software, the hardware is pretty much useless.  I
> doubt any of our customers would be capable of building it even if
> they did have the source tree in hand.
> 
> --
> Grant Edwards               grant.b.edwards        Yow! If I had a
> Q-TIP, I
>                                   at               could prevent th'
>                                   collapse
>                               gmail.com            of NEGOTIATIONS!!
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

From: Eric Seifert <eric.seifert@cyaninc.com>
Date: Wed, 29 Aug 2012 08:36:29 -0700
Subject: [Buildroot] 2012.08-rc3 skipping python modules during build
In-Reply-To: <20120829135403.2af6eb43@skate>
References: <CALoHCLOK1-F5uxiWc95Mr6SJwCc2sqxicBi5V93-HtuBOhY0kA@mail.gmail.com>
 <20120829011800.01eb081e@skate> <503D63DF.8060803@mind.be>
 <20120829135403.2af6eb43@skate>
Message-ID: <CALoHCLMYaSM+X3Nx2BG6PA5juG82uZOC1-nofwj=bLhHVG4z4w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Guys, that's the issue. I appreciate everyone's responsiveness! I
will submit the python module packages when I have worked out some issues
with them.

Thanks,
Eric Seifert

On Wed, Aug 29, 2012 at 4:54 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Le Wed, 29 Aug 2012 02:35:43 +0200,
> Arnout Vandecappelle <arnout@mind.be> a ?crit :
>
> >   Maybe we should temporarily add something like
> >
> > GENTARGETS = $$(error The GENTARGETS macro no longer exists; use
> $$$$(eval $$$$(generic-package)) or $$$$(eval
> > $$$$(generic-host-package)))
>
> Care to send a patch for this (and the AUTOTARGETS, CMAKETARGETS as
> well) ?
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120829/809577c1/attachment.html>

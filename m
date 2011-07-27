From: Avishay Orpaz <avishorp@gmail.com>
Date: Thu, 28 Jul 2011 00:50:59 +0300
Subject: [Buildroot] Getting Kconfig menu right
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C60486D4@ex-mb1.corp.adtran.com>
References: <CAMkyJgDML5mip30tPA9962uOjHnzAWFVWTKRr8RZei3LG6W1ew@mail.gmail.com>
 <F9C551623D2CBB4C9488801D14F864C60486D4@ex-mb1.corp.adtran.com>
Message-ID: <CAMkyJgBPsLbiAoTyuBDrcQeiFCN9qTyUK3qb1V7_pj=2QWPrAQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

That's exactly what I did, but the item shows up below libfuse, not as its
child.


2011/7/28 ANDY KENNEDY <ANDY.KENNEDY@adtran.com>

> > Hi
> > I'm trying to add python-fuse to buildroot. I have the makefile
> > working, but there is only one little problem left. I would like
> > the option for python-fuse to show up as a sub-item of libfuse,
> > only when libfuse is checked. It should be similar, for example, to
> > lua - when selected, some relevant sub-options appear as sub-items
> > in the xconfig menu. I looked very closely on the lua Config.in,
> > but found nothing that tells Kconfig to show all the options as a
> > sub-items.
> > How can I do this?
>
> depends on BR2_<lib fuse pkg name>
>
> OR
>
> if BR2_<lib fuse pkg name>
>
> endif
>
> Must be done in the same Config.in as the lib fuse, however.
>
> Andy
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110728/4ff48d64/attachment.html>

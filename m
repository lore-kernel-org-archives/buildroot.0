From: Julien Grossholtz <julien.grossholtz@gmail.com>
Date: Tue, 31 Dec 2019 16:30:28 +0100
Subject: [Buildroot] [PATCH] DEVELOPERS: add Julien Grossholtz as
 contact for ts7680_defconfig
In-Reply-To: <20191231151750.GF26395@scaer>
References: <20190811120739.26539-2-thomas.petazzoni@bootlin.com>
 <20191231151750.GF26395@scaer>
Message-ID: <CAHxQtxO+yhvzjTJW2iDJd+fn23qs4fNv-7BvwDPG46rg5A7aSw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I no longer have access to this board, so a can not maintain it. I
added my former manager, Jerome Oufella to this thread so he can
decide if he wants to keep this board upstream.

Thanks,

Le mar. 31 d?c. 2019 ? 16:17, Yann E. MORIN <yann.morin.1998@free.fr> a ?crit :
>
> Thomas, All,
>
> On 2019-08-11 14:07 +0200, Thomas Petazzoni spake thusly:
> > Julien originally added this defconfig in 2017, so let's add him as a
> > contact for it, so that he receives build failure notifications and is
> > Cc'ed on patches.
> >
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Cc: Julien Grossholtz <julien.grossholtz@gmail.com>
>
> Applied to master, thanks.
>
> > ---
> > Julien, could you please reply with your Acked-by if you are fine with
> > this? Thanks!
>
> Julien, we really need people to take care of the defconfigs, at least
> when they fail to build. Without caretakers interested in those, we may
> have to remove them in the end.
>
> If you really can't handle it, please say so, so we can tale appropriate
> action.
>
> Thanks! ;-)
>
> Regards,
> Yann E. MORIN.
>
> > ---
> >  DEVELOPERS | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index 8995065c5f..8a2128e1ef 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -1289,6 +1289,8 @@ N:      Julien Floret <julien.floret@6wind.com>
> >  F:   package/lldpd/
> >
> >  N:   Julien Grossholtz <julien.grossholtz@openest.io>
> > +F:   board/technologic/ts7680/
> > +F:   configs/ts7680_defconfig
> >  F:   package/paho-mqtt-c
> >
> >  N:   Julien Olivain <juju@cotds.org>
> > --
> > 2.21.0
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'

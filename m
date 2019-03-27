From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 27 Mar 2019 18:26:09 +0530
Subject: [Buildroot] [PATCH v2] board: rename pine64 to pine64_a64
In-Reply-To: <20190325180108.15704071@windsurf>
References: <20190202040519.14568-1-philip.a.molloy@gmail.com>
 <CAMty3ZAodmPT6=aX3wFvwY-r6O6p5XVN3qgG5s5E-anft1Ku2Q@mail.gmail.com>
 <20190325180108.15704071@windsurf>
Message-ID: <CAMty3ZDPhsZiDxtgy0FFvTKA7rydTtPHsRFf2GgNuaWSQ=Db+g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 25, 2019 at 10:31 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> I haven't seen the original patch. Was it sent to the Buildroot mailing
> list ? It doesn't seem like it reached the mailing list.
>
> Philip: did you register on the mailing list before sending your
> patch ? If not, could you subscribe to the mailing list and resend ?
> Thanks!
>
> On Mon, 25 Mar 2019 10:43:45 +0530
> Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> > >  N:     James Hilliard <james.hilliard1@gmail.com>
> > > diff --git a/board/pine64/pine64/boot.cmd b/board/pine64/a64/boot.cmd
> > > similarity index 100%
> > > rename from board/pine64/pine64/boot.cmd
> > > rename to board/pine64/a64/boot.cmd
> > > diff --git a/board/pine64/pine64/genimage.cfg b/board/pine64/a64/genimage.cfg
> > > similarity index 100%
> > > rename from board/pine64/pine64/genimage.cfg
> > > rename to board/pine64/a64/genimage.cfg
> >
> > pine64 is vendor who produced pine64 board. and same vendor producing
> > sopine. so renaming to a64 doesn't valid.
>
> What? I'm sorry I don't understand what you mean here.
>
> The typical Buildroot folder organization is:
>
>         board/<vendor>/<boardname>/
>
> pine64 is indeed a vendor name, and a64 is a board name, according to
> https://www.pine64.org/?page_id=46823. So the change looks perfect
> correct to me. It will allow to add support for other boards produced
> by Pine64, in board/pine64/<boardname>/.

The above link is for LTS which typically share different dts. The
existing support is been added for non LTS based
https://www.pine64.org/?page_id=1194

So the board name is PINE same as SOPINE on here
https://www.pine64.org/?page_id=1491

We can structure board/pine64/pine and board/pine64/sopine (which is
already present).

>
> > > -Pine64 link:
> > > +Pine A64 link:
> > >  https://www.pine64.org/?page_id=1194
> >
> > It has wiki link below, that intern routing pine64 board link. wiki
> > has Mainline stuff information.
>
> I'm not a native English speaker, so I might be wrong, but I believe
> "that intern routing pine64 board link" doesn't make any sense in
> English. What are you trying to say here ?

What I'm saying here is, the wiki has board link and we may not
specify explicitly.

From: Asaf Kahlon <asafka7@gmail.com>
Date: Tue, 9 Oct 2018 22:47:53 +0300
Subject: [Buildroot] [PATCH 2/4] python-ply: new package
In-Reply-To: <CAGm1_kuNbJzj+EWwEGcoUG5PRwoJ+4=k2vo0ri1g091v-6r4Eg@mail.gmail.com>
References: <20180922193631.14369-1-asafka7@gmail.com>
 <20180922193631.14369-2-asafka7@gmail.com>
 <20181009212722.4ab34b54@windsurf>
 <CAGm1_kuNbJzj+EWwEGcoUG5PRwoJ+4=k2vo0ri1g091v-6r4Eg@mail.gmail.com>
Message-ID: <CALFsTFWZ8tH4+zg6NMxvLwYwTfbYEOkFdT8P+VbG6PQunjs0RQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, Oct 9, 2018 at 10:39 PM Yegor Yefremov
<yegorslists@googlemail.com> wrote:
>
> On Tue, Oct 9, 2018 at 9:27 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > Hello,
> >
> > Thanks for this patch. I've applied to master, with one change, see
> > below.
> >
> > On Sat, 22 Sep 2018 22:36:29 +0300, Asaf Kahlon wrote:
> >
> > > +PYTHON_PLY_LICENSE = BSD
> >
> > "BSD" as a value for license is always wrong, because it's not specific
> > enough. We need to know the variant of BSD license being used.
> >
> > Yegor: the scanpypi script needs to be updated to not put "BSD", but
> > something that includes a warning that ensures that the user of
> > scanpypi will know he will have to do additional research to find what
> > is the exact license. I think we discussed this already, but we had
> > some similar discussion on scancpan with Fran?ois, so I'm not sure to
> > remember :)
>
> Yes, we have discussed the issue :-)
>
> @Asaf have you installed spdx_lookup [1] package?
I'm not 100% sure, but if I remember correctly, I have.

>
> [1] https://pypi.org/project/spdx-lookup/
>
> Yegor
>
> > In this case, the license was BSD-3-Clause. Applied with this fixed.
> >
> > Thanks!
> >
> > Thomas
> > --
> > Thomas Petazzoni, CTO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com

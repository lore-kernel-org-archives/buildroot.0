From: Anand Sivaram <aspnair@gmail.com>
Date: Sun, 20 Nov 2016 11:06:51 +0530
Subject: [Buildroot] BoringSSL library support in buildroot
In-Reply-To: <20161119204110.5ba9f1f9@gmx.net>
References: <CAHBw83e0xk344cq4FDH7CfvthO_Ku84pdH28MY7nLJyQsDeVCA@mail.gmail.com>
 <20161118094756.69991365@free-electrons.com>
 <CAHBw83dx-Hytbtd8DQmfY1Nziu302K+2ONeLy0R=VNc2w=gPnQ@mail.gmail.com>
 <20161119204110.5ba9f1f9@gmx.net>
Message-ID: <CAHBw83dj0k4b2A=j1iBjan8VTCF+fyi8oWpCFr_8ix9G0cB-mw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

That is correct.  But, BoringSSL has fixed a lot of issues of OpenSSL,
removed lots of legacy stuff and APIs are pretty well compatible (as of
now).
I  agree, BoringSSL folks may not care too much about API compatibility and
it could potentially be a problem going forward.

I am having a host build for my application and on Debian, I could get it
working with BoringSSl with a couple of hours of work without using any
specific #ifdef, Now it works both with OpenSSL1.0.2 and BoringSSL.

When I get a bit of time, I would definitely try see I could compile it in
buildroot.

Thanks and Best Regards

Anand




On 20 November 2016 at 01:11, Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Anand,
>
> On Fri, 18 Nov 2016 14:19:30 +0530, Anand Sivaram <aspnair@gmail.com>
> wrote:
>
> > Thanks Thomas for the clarification :)
> >
>
> Take a look at [1] for boringssl support ;-)
>
> Regards,
> Peter
>
> [1] https://patchwork.ozlabs.org/patch/696886/
>
> > Anand
> >
> > On 18 November 2016 at 14:17, Thomas Petazzoni <
> > thomas.petazzoni at free-electrons.com> wrote:
> >
> > > Hello,
> > >
> > > On Fri, 18 Nov 2016 09:02:21 +0530, Anand Sivaram wrote:
> > >
> > > > Is there any plan for supporting Google's BoringSSL in buildroot?
> > > > It is gaining momentum nowadays.
> > >
> > > The plan in Buildroot is like in most open-source project: merge
> > > patches that are proposed/contributed.
> > >
> > > So if someone proposes a patch to add support for BoringSSL, Buildroot
> > > will have support for it. If nobody proposes a patch, then we won't
> > > have BoringSSL support.
> > >
> > > It's as simple as that :)
> > >
> > > Best regards,
> > >
> > > Thomas
> > > --
> > > Thomas Petazzoni, CTO, Free Electrons
> > > Embedded Linux and Kernel engineering
> > > http://free-electrons.com
> > >
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161120/aa2b47e4/attachment.html>

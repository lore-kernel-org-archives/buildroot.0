From: Fache, Herve <h-fache@ti.com>
Date: Tue, 13 Sep 2011 11:49:30 +0200
Subject: [Buildroot] Download external toolchain with make source
In-Reply-To: <201107082316.38408.yann.morin.1998@anciens.enib.fr>
References: <CA+Xn3W1gTygZ03eu15dafntc2Nynn6X=cNgzKsW2RmRh9oPh2A@mail.gmail.com>
 <87ei20yiab.fsf@macbook.be.48ers.dk>
 <201107082316.38408.yann.morin.1998@anciens.enib.fr>
Message-ID: <CA+Xn3W0HLmRRChgWznXWUZ-5NeQRNU1LF6KOKxmfvHj-w-LNVg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 8, 2011 at 23:16, Yann E. MORIN <yann.morin.1998@anciens.enib.fr
> wrote:

> Peter, Herv?, All,
>
> On Friday 08 July 2011 16:10:52 Peter Korsgaard wrote:
> > >>>>> "Herve" == Fache, Herve <h-fache@ti.com> writes:
> >
> >  Herve> Hello list,
> >  Herve> We have a need for an external toolchain, and need to be able to
> >  Herve> download everything for off-line compilation. To reach this goal,
> we
> >  Herve> have added the option for make source to download the external
> >  Herve> toolchain together with the packages.
> >
> >  Herve> I thought you may be interested in this very simple patch to
> support
> >  Herve> this feature :-)
> >
> > Thanks. I would prefer to use (ab)use the uclibc-source target, similar
> > to how we ensure the external toolchain gets setup before building
> > packages.
> >
> > I also just noticed crosstool-ng needs it as well.
>
> For crosstool-NG, that's not that easy. There is no top-level rule to just
> do the download. crosstool-NG does its own downloading.
>
> So, we have to build crosstool-NG, which implies building host-gawk and
> host-automake, and their dependencies...
>
> I've done the necessary stuff here, and will post a patch shortly after a
> little bit more of testing...
>

I can't see this in the latest release, or am I looking in the wrong place?

Kind regards,
Herv?
-- 
Texas Instruments France SA, 821 Avenue Jack Kilby, 06270 Villeneuve Loubet.
036 420 040 R.C.S Antibes. Capital de EUR 753.920
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110913/d808e7f8/attachment.html>

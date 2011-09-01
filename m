From: Mohamed Mohamed Nour El-Din Hassib <eng.mohamed.nour.eldin@gmail.com>
Date: Thu, 1 Sep 2011 10:25:24 +0200
Subject: [Buildroot] Incorrect selection of the C library
In-Reply-To: <20110901080041.GA17843@sapphire.tkos.co.il>
References: <CAL7CV-cF7QedAikQ35GoJ_FBpAkzhYVwyBbz-6bu7BPu0pwJqA@mail.gmail.com>
 <20110901080041.GA17843@sapphire.tkos.co.il>
Message-ID: <CAL7CV-dJ8+228WjUvOY2k_FP85HMgJ651tqSqfqfJaY4RZJB3Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Oh! ok, thanks a lot Baruch,

On Thu, Sep 1, 2011 at 10:00 AM, Baruch Siach <baruch@tkos.co.il> wrote:

> Hi Mohamed,
>
> On Thu, Sep 01, 2011 at 09:54:48AM +0200, Mohamed Mohamed Nour El-Din
> Hassib wrote:
> > I'm trying to build a filesystem & I'm using an external toolchain,
> >
> > This toolchain was made using ELDK with glibc as the C library, so in the
> > toolchain config, I specify the external toolchain's path & select
> "glibc"
> > for the C library field,
> >
> > When trying "make", I get:
> > *Checking external toolchain settings*
> > *Incorrect selection of the C library*
> > *
> > *
> > So can you help me with this?
>
> Buildroot does not support ELDK toolchains. See
> http://buildroot.uclibc.org/downloads/buildroot.html#external_toolchain.
>
> baruch
>
> --
>                                                     ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110901/10733655/attachment.html>

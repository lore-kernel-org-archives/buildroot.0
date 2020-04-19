From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sun, 19 Apr 2020 09:47:48 -0300
Subject: [Buildroot] [PATCH] package/asn1c: new host package
In-Reply-To: <CAEyMn7ZJS0uSQk4yaU=bEsXNpJoRj767A-3M_p5ONjsB_35x+w@mail.gmail.com>
References: <20200110211420.7704-1-sergio.prado@e-labworks.com>
 <CAEyMn7Y=aY1zO0Wm5wVzHrdmn=CDrzJJ=aepgm5rXXJ4Hir-uw@mail.gmail.com>
 <87imhwcfbq.fsf@tarshish>
 <CAEyMn7ZJS0uSQk4yaU=bEsXNpJoRj767A-3M_p5ONjsB_35x+w@mail.gmail.com>
Message-ID: <CANu7NGuPU+2ozuf0xDnGC3DeBF7+q9kMrBg+oe6mRSOAA9Ee5Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Heiko, Baruch,

So it looks like I don't need to rework the patch, thanks.

Best regards,

Sergio Prado
Embedded Labworks
Mobile: +55 11 97123-3420


Em dom., 19 de abr. de 2020 ?s 02:39, Heiko Thiery <heiko.thiery@gmail.com>
escreveu:

> Hi Baruch, Hi Sergio,
>
> Am So., 19. Apr. 2020 um 05:41 Uhr schrieb Baruch Siach <baruch@tkos.co.il
> >:
> >
> > Hi Heiko, Sergio,
> >
> > On Fri, Apr 17 2020, Heiko Thiery wrote:
> > >> +ASN1C_VERSION = 0.9.28
> > >> +ASN1C_SITE =
> https://github.com/vlm/asn1c/releases/download/v$(ASN1C_VERSION)
> > >
> > > You can use the github macro to set the <pkg>_SITE variable:
> > > ASN1C_SITE = $(call github,vlm,asn1c,v$(ASN1C_VERSION))
> >
> > When the package author provides a tarball we usually prefer to use it.
> >
> >   If the package you wish to add does have a release section on GitHub,
> >   the maintainer may have uploaded a release tarball, or the release may
> >   just point to the automatically generated tarball from the git tag. If
> >   there is a release tarball uploaded by the maintainer, we prefer to use
> >   that since it may be slightly different (e.g. it contains a configure
> >   script so we don?t need to do AUTORECONF).
> >
> > This is quoted from
> > https://buildroot.org/downloads/manual/manual.html#github-download-url
> >
> > In this case the tarball indeed contains a pre-generated configure
> > script.
> >
>
> You're right. The released version should be preferred.
>
> > baruch
> >
> > --
> >      http://baruch.siach.name/blog/                  ~. .~   Tk Open
> Systems
> >
> =}------------------------------------------------ooO--U--Ooo------------{=
> >    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
>
> Sorry for that mistake.
>
> --
> Heiko
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200419/995e940d/attachment.html>

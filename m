From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 27 Nov 2018 08:17:36 +0100
Subject: [Buildroot] [PATCH 1/2] dante: add AUTORECONF=YES
In-Reply-To: <20181126194323.GJ28830@scaer>
References: <20181126182248.24817-1-fontaine.fabrice@gmail.com>
 <20181126194323.GJ28830@scaer>
Message-ID: <CAPi7W824aKm=wYcmBrjZqVCq6FtDiGxroGJoyZS_dROB95Fcew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann,

Le lun. 26 nov. 2018 ? 20:43, Yann E. MORIN <yann.morin.1998@free.fr> a
?crit :

> Fabrice, All,
>
> On 2018-11-26 19:22 +0100, Fabrice Fontaine spake thusly:
> > We're patching compiler.m4
>
> Duh? Already submitted:
>
>     https://patchwork.ozlabs.org/patch/1002784/

I know but I wanted to send the second patch of the serie without waiting
for your first patch to be applied.

>
>
> Regards,
> Yann E. MORIN.
>
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/dante/dante.mk | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/dante/dante.mk b/package/dante/dante.mk
> > index a147aa36dc..ff42e7432b 100644
> > --- a/package/dante/dante.mk
> > +++ b/package/dante/dante.mk
> > @@ -9,8 +9,8 @@ DANTE_SITE = http://www.inet.no/dante/files
> >  DANTE_LICENSE = BSD-3-Clause
> >  DANTE_LICENSE_FILES = LICENSE
> >
> > -# Dante uses a *VERY* old configure.ac
> > -DANTE_LIBTOOL_PATCH = NO
> > +# We're patching compiler.m4
> > +DANTE_AUTORECONF = YES
> >
> >  DANTE_CONF_OPTS += --disable-client --disable-preload --without-pam
> >
> > --
> > 2.14.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>
Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181127/f2c95ae6/attachment.html>

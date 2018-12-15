From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 Dec 2018 12:04:39 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/mesa3d: bump to version
 18.3.1
In-Reply-To: <CADvTj4pXxGg4uTWi2xevajAiUiv95V15uMDopsWd4j=4tnhZcQ@mail.gmail.com>
References: <1544861438-11607-1-git-send-email-james.hilliard1@gmail.com>
 <20181215103930.GC2625@scaer>
 <CADvTj4pXxGg4uTWi2xevajAiUiv95V15uMDopsWd4j=4tnhZcQ@mail.gmail.com>
Message-ID: <20181215110439.GF2625@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2018-12-15 03:56 -0700, James Hilliard spake thusly:
> On Sat, Dec 15, 2018 at 3:39 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > > diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> > > index f3ee69b..2fe46bd 100644
> > > --- a/package/mesa3d/mesa3d.mk
> > > +++ b/package/mesa3d/mesa3d.mk
> > > @@ -5,7 +5,7 @@
> > >  ################################################################################
> > >
> > >  # When updating the version, please also update mesa3d-headers
> > > -MESA3D_VERSION = 18.3.0
> > > +MESA3D_VERSION = 18.3.1
> >
> > As Bernd already pointed out, you need to also update mesa3d-headers
> > too. What made you miss the notice just above? Do you have a suggestion
> > so that the next one who bumps either mesa3d or mesa3d-headers does not
> > miss it next time?
> It was 1am when I sent this

Aha! :-)

> and literally only looked for the version
> number to bump it when debugging a build failure. Wouldn't it make
> sense to have mesa3d and mesa3d-headers share the same package version
> so that only one needs to be bumped?

That's unfortunately not possible, see the comment in mesa3d-headers...

Regards,
Yann E. MORIN.

> > Regards,
> > Yann E. MORIN.
> >
> > >  MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
> > >  MESA3D_SITE = https://mesa.freedesktop.org/archive
> > >  MESA3D_LICENSE = MIT, SGI, Khronos
> > > --
> > > 2.7.4
> > >
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot at busybox.net
> > > http://lists.busybox.net/mailman/listinfo/buildroot
> >
> > --
> > .-----------------.--------------------.------------------.--------------------.
> > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> > | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> > '------------------------------^-------^------------------^--------------------'

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

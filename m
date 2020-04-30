From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 30 Apr 2020 22:13:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/pkg-meson.mk: set correct
 pkgconfig for native dependencies
In-Reply-To: <CADvTj4ofOtmzMiVPHS1OJXYZZvcMFUU30=3=j7uweMkS-+XsFA@mail.gmail.com>
References: <20200428040638.122494-1-james.hilliard1@gmail.com>
 <20200428072202.5889620f@windsurf.home>
 <d96ae071-26fa-25a4-a508-d52d82daafeb@mind.be>
 <20200428091022.4c613e80@windsurf.home>
 <0f40c7ae-22d4-f9fa-80e5-5b81617e8d78@mind.be>
 <CADvTj4oX9oQTxpHLEyKMACWHwLh4pL13C4nrK=9wVkQebhV5rA@mail.gmail.com>
 <20200428105748.282b13ad@windsurf.home>
 <CADvTj4ofOtmzMiVPHS1OJXYZZvcMFUU30=3=j7uweMkS-+XsFA@mail.gmail.com>
Message-ID: <20200430201338.GP11346@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2020-04-30 14:06 -0600, James Hilliard spake thusly:
> On Tue, Apr 28, 2020 at 2:57 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > On Tue, 28 Apr 2020 02:05:13 -0600
> > James Hilliard <james.hilliard1@gmail.com> wrote:
> >
> > > >  Thanks James and Thomas for correcting me.
> > > >
> > > >  So in that case, this patch looks good. But the meson.mk change should be a
> > > > separate patch, of course.
> > > That would overlap with the weston -Dbuild.pkg_config_path removal.
> >
> > You add -Dbuild.pkg_config_path in pkg-meson.mk in a first patch.
> https://patchwork.ozlabs.org/project/buildroot/patch/20200428122213.63826-1-james.hilliard1 at gmail.com/
> >
> > Then in a second patch, you remove it from weston.mk.
> https://patchwork.ozlabs.org/project/buildroot/patch/20200428122213.63826-2-james.hilliard1 at gmail.com/
> >
> > Yes, in between it means it is passed twice, but this is OK, as it
> > doesn't break.
> Ok, I've sent the moving of -Dbuild.pkg_config_path from weston.mk
> to pkg-meson.mk as a 2 patch series, I'll follow up with the removal of
> the other workarounds after those are merged.

Have seen them, thanks.

However, I am not sure I followed what is still needed about this meson
stuff: care to heck the status of each patch and seris on patchwork, nad
mark as rejected or not-applicable those that no longer make sense,
please?

Regards,
Yann E. MORIN.

> > Thomas
> > --
> > Thomas Petazzoni, CTO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 5 Mar 2020 18:21:31 +0100
Subject: [Buildroot] [PATCH/next v2] package/mesa3d: fix nouveau
 std::isinf related compile failure
In-Reply-To: <20200304221146.461a3864@gmx.net>
References: <20200304110050.29607-1-ps.report@gmx.net>
 <20200304175800.GB5357@scaer> <20200304221146.461a3864@gmx.net>
Message-ID: <20200305172131.GG5357@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2020-03-04 22:11 +0100, Peter Seiderer spake thusly:
> On Wed, 4 Mar 2020 18:58:00 +0100, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > On 2020-03-04 12:00 +0100, Peter Seiderer spake thusly:
> > > Activate already existing mesa3d solution for the isinf compile
> > > failure for uclibc based toolchains instead of using a custom
> > > workaround.
> > >
> > > - remove 0005-src-gallium-drivers-nouveau-codegen-nv50_ir_ra.cpp-p.patch
> > > - add 0004-c99_math-import-isinf-for-uclibc-based-toolchains.patch
> > >
> > > Fixes:
> > >   http://autobuild.buildroot.net/results/cbefc5d4a4fefb674e596400fa1d2698cd89c5b3/
> > >   http://autobuild.buildroot.net/results/dc974da012f53fa4ed3be616f937b0afae423d66/
> > You've tagged this patch for next, but the two failures pccured on
> > master.
> > Where should this patch be applied, then?
> The patch [1] was meant for master (minimal change, minimal risk)
> and this one (v1/v2) for next..., chronological later, first not
> sure about the solution...., but after re-thinking more sure this
> one is the right (and upstream acceptable) solution suitable for
> master and next...

Followign this discusion, I've applied it to master (rather than next).
Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

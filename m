From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 25 Jun 2020 21:59:46 +0200
Subject: [Buildroot] [PATCH 0/5 v4] package/xenomai: add alternate
 download locations (branch yem/xenomai-custom)
In-Reply-To: <20200624232745.548bdf7a@windsurf>
References: <cover.1579035147.git.yann.morin.1998@free.fr>
 <20200624232745.548bdf7a@windsurf>
Message-ID: <20200625195946.GN20645@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-06-24 23:27 +0200, Thomas Petazzoni spake thusly:
> On Tue, 14 Jan 2020 21:55:20 +0100
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > Jan Kiszka (1):
> >       package/xenomai: add support to download from a custom git tree
> Applied.
> > Yann E. MORIN (4):
> >       package/xenomai: move the version setting to Kconfig
> >       package/xenomai: add support to download a custom tarball
> Both applied.

Thanks! :-)

> >       package/xenomai: add support to download from a custom Hg tree
> >       package/xenomai: add support to download from a custom svn tree
> I have not applied those ones, I think it's too unlikely to ever be
> needed.

I agree, but then how often are people expected to use hg or svn to
store their kernel trees? Their Uboot trees?

Against all odds, some people are willing to go to those extremities and
suffer every day... ;-]

That's what I modeled xenomai after (the kernel and uboot, not the
suffering!). But OK, I don't care enough. ;-)

Thanks for applying the rest of the series.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

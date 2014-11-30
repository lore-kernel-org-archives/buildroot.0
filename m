From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 14:48:03 +0100
Subject: [Buildroot] [PATCH] package/shairport-sync: fix static builds
In-Reply-To: <1417349351.882.7.camel@posteo.de>
References: <1417268097-29884-1-git-send-email-yann.morin.1998@free.fr>
 <20141130113557.GB4124@free.fr> <1417349351.882.7.camel@posteo.de>
Message-ID: <20141130134803.GD4124@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?rg, All,

On 2014-11-30 13:09 +0100, J?rg Krause spake thusly:
> On So, 2014-11-30 at 12:35 +0100, Yann E. MORIN wrote:
> > 
> > All three patches applied upstream:
> >     https://github.com/mikebrady/shairport-sync/commit/2a430ec434674ed8c1959698c061662bb7abc1a1
> >     https://github.com/mikebrady/shairport-sync/commit/e5a74a3ff08134a2b11f07bd850659d7816fb03d
> >     https://github.com/mikebrady/shairport-sync/commit/1f759e57e8c0682613eaaf89a46fdf6db4c6b5cd
> > 
> > There is now a new release with those three patches, but that would make
> > us bump pass a few releases, from 2.1.8 to 2.1.13, with some new
> > features along the lines.
> > 
> > So, for the release, I suggest we just apply those three patches, and
> > I'll send a version bump after the release has been cut.
> > 
> > Is that OK?
> 
> First, many thanks for your work! I had a look at the autobuild errors,
> but it was beyond my knowledge.
> 
> Version 2.1.9 to 2.1.13 include several bugfixes, so I would suggest to
> update the package. I can make a run-time test tomorrow.

We are too close to the (Buildroot!) release to do a version bump, which
is due today (last day of the month). And the new shairport-sync release
with those three patches included is not yet available (code has been
updated, but no tg or tarball is available yet).

I plan on doing a version bump right after both the Buildroot and
shairport-sync releases are out, though.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Thu, 24 Jul 2014 22:48:14 +0200
Subject: [Buildroot] [OpenWrt-Devel] uClibc-ng
In-Reply-To: <14764ab3680.2772.7d831ebe34b31eacf7a4325c447c5923@gmail.com>
References: <20140720191326.GD4431@waldemar-brodkorb.de>
 <CAGVrzcZxcgP+yerqW=1ZDrmgiFmOz9eTwFB2KvZ6Xt2MJpbpDA@mail.gmail.com>
 <20140721204239.61b225fe@free-electrons.com>
 <CAGVrzcZja2DTrJGA2QWsMH=2GgUBuouSetK+-cUdXY7XbyA8SA@mail.gmail.com>
 <20140721212700.41e29653@free-electrons.com>
 <A7BE1426-88C8-457E-8FE5-0427CC5B1D72@workware.net.au>
 <53CF9F9D.60903@jodybruchon.com>
 <14764ab3680.2772.7d831ebe34b31eacf7a4325c447c5923@gmail.com>
Message-ID: <20140724204814.GE13324@nbbrfq.cc.univie.ac.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 23, 2014 at 09:20:51PM +0200, Carmelo Amoroso wrote:
> 
> 
> Il 23 luglio 2014 13:42:38 Jody Bruchon <jody@jodybruchon.com> ha scritto:
> 
> >On 7/22/2014 11:30 PM, Steve Bennett wrote:> I would like to add my
> >support to Thomas' position.
> > > Regardless of what happens with glibc and/or musl, an active community
> > > supporting regular releases of uClibc is a good thing.
> > > Time has spoken that we can't expect this to happen unless something
> >changes.
> >
> >I agree. It is better to have a responsive maintainer releasing periodic
> >"stable" versions than to have what is essentially no maintainer and
> >sustained long-term fragmentation of what "uClibc" really is. If the
> >uClibc maintainer wakes up in the future and begins releasing again, the
> >new project's changes can always be merged back to the parent, as they
> >did with eglibc and glibc. For now we need to focus on making a stable
> >release, something which is grossly overdue and harms all projects
> >currently using uClibc.
> >
> >I also agree that musl is an interesting project with a bright future
> >(and a bright present for that matter), but it does not cover all of
> >what uClibc covers and the number of projects that already require
> >uClibc is too large to simply drop uClibc and move to musl.
> >
> >-Jody Bruchon
> 
> Gents,
> Are we considering anyway that Bernard has recently restarted with patches
> review and commit without no contribution from the other co-maintainers
> (myself the first) ?
> Likely Bernard is already preparing a release !

Yea, but very very slowly, i know.
I just started preparing a meta-changelog for the release notes and
then we'll call it an official tarball.

Lots of changes, about 10% done, approx. 1h left before bedtime.

Any prominent changes we should make absolutely sure to mention?

From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Tue, 20 Jan 2009 09:07:49 +0100
Subject: [Buildroot] Status of "mplayer" in buildroot
In-Reply-To: <200901200857.39283.markus.heidelberg@web.de>
References: <1232395188.4539.20.camel@elrond.atmel.com>
	<20090120072738.77f10839@hcegtvedt>
	<200901200857.39283.markus.heidelberg@web.de>
Message-ID: <20090120090749.341d3958@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 20 Jan 2009 08:57:38 +0100
Markus Heidelberg <markus.heidelberg@web.de> wrote:

> Hans-Christian Egtvedt, 20.01.2009:
> > On Mon, 19 Jan 2009 20:59:47 +0100
> > Ulf Samuelsson <ulf.samuelsson@atmel.com> wrote:
> > 
> > > 2) mplayer do not have any recent "versions".
> > >    Instead you are encouraged to checkout the latest svn.
> > > 
> > 
> > It is just plain bad to depend on a random checkout. Perhaps we can
> > use debians/ubuntus "release"?
> > 
> > MPlayer v1.0rc2 + mplayer_1.0~rc2-0ubuntu17.diff.gz ?
> > 
> > When I look more into it, the Ubuntu diff is just adding pulse audio
> > support and various version and other doc changes.
> 
> Or a Gentoo package:
> http://distfiles.gentoo.org/distfiles/mplayer-1.0_rc2_p28288.tar.bz2
> 
> There we don't have to fear distribution specific stuff and exactly
> know the version we use due to the svn revision in the filename.
> 

Great, that sounds a lot better.

My suggestion for my own work flow is to push the AVR32 stuff into
upstream and then grab back a subversion cut from gentoo (or other
"release") which then will incorporate the AVR32 stuff in a more sane
way.

-- 
Best regards,
Hans-Christian Egtvedt

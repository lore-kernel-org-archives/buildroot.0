From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Aug 2017 00:17:14 +0200
Subject: [Buildroot] [git commit] CHANGES: update after binutils changes
In-Reply-To: <CAAkeqgVCXiR0g0HRUuGyPRivJFschFc4FGxan2B=EpYrucGsQQ@mail.gmail.com>
References: <20170801213610.2254F802AA@busybox.osuosl.org>
 <CAAkeqgVCXiR0g0HRUuGyPRivJFschFc4FGxan2B=EpYrucGsQQ@mail.gmail.com>
Message-ID: <20170802001714.649bab5c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 1 Aug 2017 15:11:26 -0700, Andrey Yurovsky wrote:

> >         - Switch to gcc 6.x as the default gcc version, add support
> >           for gcc 7.x, remove support for gcc 4.8  
> 
> however with GCC 7.X graphite is broken.

Only with gcc 7.x, which isn't our default gcc version yet.

> Since we're removing GCC 4.8 the fix that Arnout suggested can be
> implemented in this release and then we won't ship a broken
> configuration. https://bugs.buildroot.org/show_bug.cgi?id=10091
> (basically remove cloog, bump ISL) ... if I sent a patch implementing
> this, would it still be in time?

Since this is a fix, it can be merged post -rc1, but I'd prefer to
merge such a patch rather soon.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

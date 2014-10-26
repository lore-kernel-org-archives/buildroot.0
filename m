From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 26 Oct 2014 21:17:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/ipset: Fix compile error
In-Reply-To: <20141026175220.22d94284@free-electrons.com>
References: <1413745147-12299-1-git-send-email-bernd.kuhls@t-online.de>
 <20141026164254.2f4f8591@free-electrons.com>
 <20141026160028.GH12843@sapphire.tkos.co.il>
 <20141026175220.22d94284@free-electrons.com>
Message-ID: <20141026191703.GD2307@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Oct 26, 2014 at 05:52:20PM +0100, Thomas Petazzoni wrote:
> On Sun, 26 Oct 2014 18:00:29 +0200, Baruch Siach wrote:
> > > To fix the same problem, I've applied a slightly different fix, that
> > > simply removes -Werror altogether.
> > > 
> > > See
> > > http://git.buildroot.net/buildroot/commit/?id=a923b44112aa3bfdb42b12cc1bd2712a263c1a0c.
> > 
> > The presence of /usr/local/include directory in the include path still needs 
> > to be fixes by itself. See 
> > http://autobuild.buildroot.net/results/4f5/4f55c2415281c6204500efe28fe9e24c8ef73863/build-end.log. 
> > This comes from the AM_CPPFLAGS variable that is set in Make_global.am.
> 
> Ah, right. Could you send a patch for this?

I hope I'll have some time for this later this week.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

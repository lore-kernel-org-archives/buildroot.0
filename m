From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 1 Apr 2016 11:49:37 +0300
Subject: [Buildroot] [PATCH] gamin: fix build with musl
In-Reply-To: <20160330000518.22043b3d@free-electrons.com>
References: <d03fac44ed52ad7fe05fdd1bb6040a260cfc14b7.1456837391.git.baruch@tkos.co.il>
 <20160330000518.22043b3d@free-electrons.com>
Message-ID: <20160401084937.GC2406@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Mar 30, 2016 at 12:05:18AM +0200, Thomas Petazzoni wrote:
> On Tue,  1 Mar 2016 15:03:11 +0200, Baruch Siach wrote:
> > musl does not provide the non portable PTHREAD_MUTEX_RECURSIVE_NP. Add a patch
> > removing the assumption the PTHREAD_MUTEX_RECURSIVE_NP is available when
> > 'linux' is defined.
> > 
> > Upstream had no new release since 2008, so there is no much hope of getting
> > this fix applied upstream.
> 
> Not quite true :) If you check https://git.gnome.org/browse/gamin/log/,
> there has been a commit in early February 2016. Granted, it was the
> first commit since almost two years, but still. It's worth submitting
> upstream :-)

Done: https://mail.gnome.org/archives/gamin-list/2016-April/msg00000.html. 
First message to the gamin list since July 2013.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

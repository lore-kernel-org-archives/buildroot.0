From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 20 May 2013 12:34:23 +0300
Subject: [Buildroot] [PATCH] pixman: Apply upstream patch to fix
 compilation on MIPS
In-Reply-To: <CAG2jQ8j3fye2s1T3fXytsm+0L+dAz1i3dgOxmt7e2jb9jT22-g@mail.gmail.com>
References: <1369040459-17604-1-git-send-email-markos.chandras@gmail.com>
 <20130520092025.GF7188@tarshish>
 <CAG2jQ8j3fye2s1T3fXytsm+0L+dAz1i3dgOxmt7e2jb9jT22-g@mail.gmail.com>
Message-ID: <20130520093423.GG7188@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Markos,

On Mon, May 20, 2013 at 10:24:32AM +0100, Markos Chandras wrote:
> >>  PIXMAN_SITE = http://xorg.freedesktop.org/releases/individual/lib
> >>  PIXMAN_LICENSE = MIT
> >>  PIXMAN_LICENSE_FILES = COPYING
> >>
> >> +PIXMAN_AUTORECONF = YES
> >
> > Please add a comment explaining why this is needed.
> 
> I thought it was obvious because the patch fixes the configure.ac
> file. But ok, I will add a comment.

I missed that. In this case a comment is not needed I guess, unless others 
have a different opinion.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

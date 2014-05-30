From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 May 2014 19:48:12 +0200
Subject: [Buildroot] [PATCH] Improve tar check if bsdtar is installed
In-Reply-To: <CF7F2028-8A8C-48C4-975D-E38E7621F268@web.de>
References: <1401464676-2315-1-git-send-email-abrahamh@web.de>
 <20140530171607.GC3474@free.fr>
 <CF7F2028-8A8C-48C4-975D-E38E7621F268@web.de>
Message-ID: <20140530174812.GD3474@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, All,

On 2014-05-30 19:40 +0200, Heiko Abraham spake thusly:
> Am 30.05.2014 um 19:16 schrieb Yann E. MORIN <yann.morin.1998@free.fr>:
> > On 2014-05-30 17:44 +0200, Heiko Abraham spake thusly:
> >> ...
> > if [ -n "${version_bsd}" ]; then
> >> +  # mark as invalid tar version
> >> +  major=1
> >> +  minor=14
> >> +  bugfix=1
> > 
> > Any reason you used 1.14.1? To be obvious that this is an invalid
> > version, I'd have set it to something like:
> >    major=0
> >    minor=0
> 
> yes, we can should version 1.16.0 instead version 1.14.1.  This may be better.
> With this suggestion I will prepare a new patch.

I think using 0.0 is even better: it is clearly an invalid version.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

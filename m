From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 18 Jan 2016 23:18:08 +0100
Subject: [Buildroot] [PATCH 05/80 v1] package/collectd: use 'menuconfig'
 instead of 'config'+'menu'
In-Reply-To: <20160118230510.50308fc5@free-electrons.com>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
 <015a3c362744fb1f25235088a353f3d3689fd62f.1452983019.git.yann.morin.1998@free.fr>
 <20160118225659.16e260ac@free-electrons.com>
 <20160118220015.GC3380@free.fr>
 <20160118230510.50308fc5@free-electrons.com>
Message-ID: <20160118221808.GE3380@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-01-18 23:05 +0100, Thomas Petazzoni spake thusly:
> On Mon, 18 Jan 2016 23:00:15 +0100, Yann E. MORIN wrote:
> > I am very much and totally undecided on this either...
> > 
> > On one hand, sub-menus in sub-menus can be a bit tedious to navigate in,
> > hence the change to use comments a separators.
> > 
> > On the other hand, the new layout is definitely quite long, indeed, and
> > difficult to navigate as well.
> > 
> > I'll revert to use sub-menus, unless Peter chimes in to voice his
> > preference for the new layout.
> 
> But do we need to change anything at all for this patch?
> 
> While I agree that the alsa-lib and alsa-utils cases were silly,
> because we had a single sub-options that did nothing but give access to
> the sub-menu.
> 
> But in the case of collectd, the current situation looks good to me,
> and I don't see the need to introduce a sub-menu for it.

Well, the idea is that all packages that have sub-options all use the
same layout, so that the menuconfig really is more consistent than it is
today.

Now, tastes are very personal! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

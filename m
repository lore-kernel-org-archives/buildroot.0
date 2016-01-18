From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 18 Jan 2016 23:40:14 +0100
Subject: [Buildroot] [PATCH 05/80 v1] package/collectd: use 'menuconfig'
 instead of 'config'+'menu'
In-Reply-To: <20160118232701.47a6433f@free-electrons.com>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
 <015a3c362744fb1f25235088a353f3d3689fd62f.1452983019.git.yann.morin.1998@free.fr>
 <20160118225659.16e260ac@free-electrons.com>
 <20160118220015.GC3380@free.fr>
 <20160118230510.50308fc5@free-electrons.com>
 <20160118221808.GE3380@free.fr>
 <20160118232701.47a6433f@free-electrons.com>
Message-ID: <20160118224014.GF3380@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-01-18 23:27 +0100, Thomas Petazzoni spake thusly:
> On Mon, 18 Jan 2016 23:18:08 +0100, Yann E. MORIN wrote:
> > > But in the case of collectd, the current situation looks good to me,
> > > and I don't see the need to introduce a sub-menu for it.
> > 
> > Well, the idea is that all packages that have sub-options all use the
> > same layout, so that the menuconfig really is more consistent than it is
> > today.
> 
> Well, they won't all have a sub-menu, since according to the second
> part of your patch series, only those packages that have more than 5
> sub-options are converted to use a sub-menu.

Indeed (nit-pick: it's 5-or-more, i.e [1..4] do not warrant a sub-menu,
while [5..?[ do; but 5 is just arbitrary, we can change that).

> Aren't we bike-shedding here? :-)

And to bike-shed a bit more: collectd does have 5-or-more options, and
even has 5 sub-menus as of today, and thus would get a sub-menu under
this new rule anyway! Hehe! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

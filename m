From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 18 Jan 2016 23:00:15 +0100
Subject: [Buildroot] [PATCH 05/80 v1] package/collectd: use 'menuconfig'
 instead of 'config'+'menu'
In-Reply-To: <20160118225659.16e260ac@free-electrons.com>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
 <015a3c362744fb1f25235088a353f3d3689fd62f.1452983019.git.yann.morin.1998@free.fr>
 <20160118225659.16e260ac@free-electrons.com>
Message-ID: <20160118220015.GC3380@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-01-18 22:56 +0100, Thomas Petazzoni spake thusly:
> On Sat, 16 Jan 2016 23:36:57 +0100, Yann E. MORIN wrote:
> > Since there were multiple sub-menus, keep their prompts as a comment, to
> > properly separate all famillies of plugins.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> It is really a matter of taste, so my opinion is clearly not a strong
> one here. But I believe I actually prefer the current solution. With
> your solution yes all sub-options are hidden behind a menu. But this
> menu is now very long, and I find the "comment" in Kconfig to not be
> very nice separators to separate various parts of the menu.
> 
> They are even more confusing in that there are "comments" used as
> separators, and real "comments" about missing dependencies, causing
> confusion.
> 
> So I'm not too fan of this one, but if Arnout and you are happy with it
> and Peter likes it, that's OK, it's really a minor detail from my point
> of view.

I am very much and totally undecided on this either...

On one hand, sub-menus in sub-menus can be a bit tedious to navigate in,
hence the change to use comments a separators.

On the other hand, the new layout is definitely quite long, indeed, and
difficult to navigate as well.

I'll revert to use sub-menus, unless Peter chimes in to voice his
preference for the new layout.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

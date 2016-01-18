From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jan 2016 23:05:10 +0100
Subject: [Buildroot] [PATCH 05/80 v1] package/collectd: use 'menuconfig'
 instead of 'config'+'menu'
In-Reply-To: <20160118220015.GC3380@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
 <015a3c362744fb1f25235088a353f3d3689fd62f.1452983019.git.yann.morin.1998@free.fr>
 <20160118225659.16e260ac@free-electrons.com>
 <20160118220015.GC3380@free.fr>
Message-ID: <20160118230510.50308fc5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 18 Jan 2016 23:00:15 +0100, Yann E. MORIN wrote:

> I am very much and totally undecided on this either...
> 
> On one hand, sub-menus in sub-menus can be a bit tedious to navigate in,
> hence the change to use comments a separators.
> 
> On the other hand, the new layout is definitely quite long, indeed, and
> difficult to navigate as well.
> 
> I'll revert to use sub-menus, unless Peter chimes in to voice his
> preference for the new layout.

But do we need to change anything at all for this patch?

While I agree that the alsa-lib and alsa-utils cases were silly,
because we had a single sub-options that did nothing but give access to
the sub-menu.

But in the case of collectd, the current situation looks good to me,
and I don't see the need to introduce a sub-menu for it.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

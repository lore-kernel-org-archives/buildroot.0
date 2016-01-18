From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jan 2016 23:27:01 +0100
Subject: [Buildroot] [PATCH 05/80 v1] package/collectd: use 'menuconfig'
 instead of 'config'+'menu'
In-Reply-To: <20160118221808.GE3380@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
 <015a3c362744fb1f25235088a353f3d3689fd62f.1452983019.git.yann.morin.1998@free.fr>
 <20160118225659.16e260ac@free-electrons.com>
 <20160118220015.GC3380@free.fr>
 <20160118230510.50308fc5@free-electrons.com>
 <20160118221808.GE3380@free.fr>
Message-ID: <20160118232701.47a6433f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Jan 2016 23:18:08 +0100, Yann E. MORIN wrote:

> > But in the case of collectd, the current situation looks good to me,
> > and I don't see the need to introduce a sub-menu for it.
> 
> Well, the idea is that all packages that have sub-options all use the
> same layout, so that the menuconfig really is more consistent than it is
> today.

Well, they won't all have a sub-menu, since according to the second
part of your patch series, only those packages that have more than 5
sub-options are converted to use a sub-menu.

Aren't we bike-shedding here? :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

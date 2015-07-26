From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 15:43:01 +0200
Subject: [Buildroot] [PATCH 0/2 v9] linux-backports: new package (branch
 yem/linux-backports)
In-Reply-To: <cover.1437688336.git.yann.morin.1998@free.fr>
References: <cover.1437688336.git.yann.morin.1998@free.fr>
Message-ID: <20150726154301.61ff3577@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Petr,

On Thu, 23 Jul 2015 23:55:25 +0200, Yann E. MORIN wrote:

> Petr Vorel (1):
>       package/linux-backports: new package
> 
> Yann E. MORIN (1):
>       package/linux-backports: switch to using the kernel-module infra

With the .SECONDEXPANSION, the custom dependency on Linux stuff, and
the trick to get the Linux .config variables in the environment, the
least we can say is that this linux-backports stuff is a bit
complicated. I hope it isn't going to blow up on us, but since it's
anyway not tested in the autobuilders, there's not a really big risk.

Only real users will test us... or the to-be-decided testing
infrastructure! :-)

Both patches applied, thanks for all the work!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

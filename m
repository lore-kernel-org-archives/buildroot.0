From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Dec 2014 22:53:24 +0100
Subject: [Buildroot] [PATCH 5/8] arch: introduce
 BR2_BINFMT_SUPPORTS_SHARED
In-Reply-To: <20141211201243.GG4199@free.fr>
References: <1417642895-29606-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417642895-29606-6-git-send-email-thomas.petazzoni@free-electrons.com>
 <20141211201243.GG4199@free.fr>
Message-ID: <20141211225324.6dc8c261@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 11 Dec 2014 21:12:43 +0100, Yann E. MORIN wrote:

> While at it, I noticed that those depends are completely superfluous,
> because FLAT can only be selected for bfin || m68k anyway, and the
> choice itself already depends on FLAT, which itself depends on bfin ||
> m68k.
> 
> So, this "depends on" (as well as the one in the previous option) could
> be removed entirely, I guess.

Indeed. I've added a separate patch doing this.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

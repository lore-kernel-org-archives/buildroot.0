From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 May 2018 21:48:29 +0200
Subject: [Buildroot] [PATCH 0/2] package/jamvm: fix build on MIPS
In-Reply-To: <cover.1526207669.git.yann.morin.1998@free.fr>
References: <cover.1526207669.git.yann.morin.1998@free.fr>
Message-ID: <20180513214829.3572c662@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 13 May 2018 12:34:35 +0200, Yann E. MORIN wrote:

> Yann E. MORIN (2):
>       package/jamvm: move arch dependency to a symbol
>       package/jamvm: restrict on what MIPS procs are allowed

Thanks, series applied to master. To be honest, I don't fully
understand the MIPS details, but since we no longer have anyone really
taking care of this architecture, it's not a big deal if we exclude too
many MIPS variants. They can always be re-enabled later when/if someone
complains.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

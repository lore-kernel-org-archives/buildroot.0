From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jan 2016 23:22:05 +0100
Subject: [Buildroot] [PATCH 10/21] libtorrent: use the proper
 BR2_TOOLCHAIN_HAS_SYNC_x symbols
In-Reply-To: <20160125221440.GN3386@free.fr>
References: <1453676887-31236-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453676887-31236-11-git-send-email-thomas.petazzoni@free-electrons.com>
 <20160125214529.GK3386@free.fr>
 <20160125230728.6b2f577a@free-electrons.com>
 <20160125221440.GN3386@free.fr>
Message-ID: <20160125232205.43e4e53e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Jan 2016 23:14:40 +0100, Yann E. MORIN wrote:

> > $ ./output/host/usr/bin/microblazeel-linux-gcc -o foo foo.c -ltorrent -lpthread
> > /home/thomas/projets/buildroot/output/host/usr/microblazeel-buildroot-linux-gnu/sysroot/usr/lib/libtorrent.so: undefined reference to `__sync_bool_compare_and_swap_1'
> > collect2: error: ld returned 1 exit status
> 
> Ah, I see my tests are no longer needed! Thanks for that!
> 
> (Note: I was not trying to turn your patch down, I was just trying to
> confirm the _1 stuff).

Sure, no problem at all. It's perfectly good to have someone double
checking all this stuff, and I took your question as a perfectly valid
question, and not in any way a mean turn the patch down.

Cheers!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

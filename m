From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Jul 2017 23:24:39 +0200
Subject: [Buildroot] [PATCH 2/3] fs/squashfs: align size to 1MiB
In-Reply-To: <03816ee56333f1eddb6ca8a048aea947fc027963.1499703968.git.yann.morin.1998@free.fr>
References: <cover.1499703968.git.yann.morin.1998@free.fr>
 <03816ee56333f1eddb6ca8a048aea947fc027963.1499703968.git.yann.morin.1998@free.fr>
Message-ID: <20170710232439.7dba43f1@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Jul 2017 18:26:19 +0200, Yann E. MORIN wrote:
> The Linux kernel will refuse to mount a squashfs image/partition that is
> not padded to a 1MiB boundary.

Besides experimental evidence, do you have a pointer to a place in the
Linux kernel documentation / code that confirms this statement ?

If you don't, that's fine, but if you have such a reference, it would
be useful to add it to the commit log.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

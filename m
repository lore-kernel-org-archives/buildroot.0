From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 23:40:11 +0100
Subject: [Buildroot] [PATCH 0/9 v2] toolchain/external: use generic
 extract commands (branch yem/extract-cmds)
In-Reply-To: <cover.1445690712.git.yann.morin.1998@free.fr>
References: <cover.1445690712.git.yann.morin.1998@free.fr>
Message-ID: <20151103234011.50fde41e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Vicente,

On Sat, 24 Oct 2015 14:48:49 +0200, Yann E. MORIN wrote:

> Yann E. MORIN (7):
>       core/pkg-generic: allow packages to exclude files when extracting

Applied.

>       toolchain-external/blacfin: always force keeping hardlinks from archives

Applied after fixing the commit title/log.

>       package/gcc: use generic extract commands

Applied.

>       toolchain/external: use generic extract commands (!blackfin case)

Applied, after adjusting how the Arago specific hook is registered and
adding a comment.

>       toolchain/external: use generic extract commands (blackfin case)

Applied.

>       toolchain/external: allow user to exclude files from custom toolchains

Rejected, because I believe it's really not adding a lot of value.

I haven't applied yet the MIPS toolchains, because I'm not super happy
with the hacks needed to get them working. I've looked at the problem,
and indeed it isn't trivial, so I wanted to give it some thought.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

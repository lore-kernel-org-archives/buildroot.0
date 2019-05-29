From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 May 2019 08:49:08 +0200
Subject: [Buildroot] [PATCH v2 4/6]
 toolchain/toolchain-external/toolchain-external-csky: new package
In-Reply-To: <CAJF2gTT5zJFuQkCwBi4q9hNwVJ6WyGD5fyNqLaxH3MUB1f7EjA@mail.gmail.com>
References: <20190528203416.32261-1-thomas.petazzoni@bootlin.com>
 <20190528203416.32261-5-thomas.petazzoni@bootlin.com>
 <CAJF2gTT5zJFuQkCwBi4q9hNwVJ6WyGD5fyNqLaxH3MUB1f7EjA@mail.gmail.com>
Message-ID: <20190529084908.53c4058e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Guo,

On Wed, 29 May 2019 13:48:31 +0800
Guo Ren <guoren@kernel.org> wrote:

> I'll delete toolchain-external-csky after toolchain buildroot is ready.
> csky-linux-tools-x86_64-glibc-linux-4.9.56-20180128.tar.gz is only
> support abiv1: ck610.
> For abiv2: ck807, ck810, ck860 need another toolchain.
> 
> So I don't want to add toolchain-external-csky and I'll change
> gx6605s_defconfig to toolchain
> buildroot in future.

OK. This makes the second part of my patch series a bit useless then,
I'll mark patches 4/6 to 6/6 as Rejected then.

Thanks for the feedback!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

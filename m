From: Guo Ren <guoren@kernel.org>
Date: Wed, 29 May 2019 13:48:31 +0800
Subject: [Buildroot] [PATCH v2 4/6]
 toolchain/toolchain-external/toolchain-external-csky: new package
In-Reply-To: <20190528203416.32261-5-thomas.petazzoni@bootlin.com>
References: <20190528203416.32261-1-thomas.petazzoni@bootlin.com>
 <20190528203416.32261-5-thomas.petazzoni@bootlin.com>
Message-ID: <CAJF2gTT5zJFuQkCwBi4q9hNwVJ6WyGD5fyNqLaxH3MUB1f7EjA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thx Thomas,

On Wed, May 29, 2019 at 4:34 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Currently, the csky_gx6605s_defconfig uses a custom pre-built external
> C-SKY toolchain. Rather than using it just for a defconfig, let's
> create a proper package for this toolchain, which will make it easier
> to use.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> Guo: I've list you as the developer in charge of this package in the
> DEVELOPERS, please let me know if this is OK for you (or not). Thanks!
I'll delete toolchain-external-csky after toolchain buildroot is ready.
csky-linux-tools-x86_64-glibc-linux-4.9.56-20180128.tar.gz is only
support abiv1: ck610.
For abiv2: ck807, ck810, ck860 need another toolchain.

So I don't want to add toolchain-external-csky and I'll change
gx6605s_defconfig to toolchain
buildroot in future.

Best Regards
 Guo Ren

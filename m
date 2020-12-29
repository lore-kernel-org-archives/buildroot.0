From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 29 Dec 2020 22:05:59 +0100
Subject: [Buildroot] [PATCH 3/5]
 toolchain/toolchain-external/toolchain-external-bootlin: regenerate for
 riscv32 toolchain
In-Reply-To: <20201207204821.3588178-3-romain.naour@gmail.com>
References: <20201207204821.3588178-1-romain.naour@gmail.com>
 <20201207204821.3588178-3-romain.naour@gmail.com>
Message-ID: <20201229220559.29a3c1f1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  7 Dec 2020 21:48:19 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/849510531
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  .../toolchain-external-bootlin/Config.in.options                 | 1 -
>  1 file changed, 1 deletion(-)

Applied as
https://git.buildroot.org/buildroot/commit/?id=e74cdd07a33785ca2c16b3ec394d41ceaf1f1aeb.
Even though our change to gen-bootlin-toolchains is different, the
resulting effect for the RISC-V 32-bit toolchain was the same with this
commit, so applied to master!

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

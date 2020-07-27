From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jul 2020 21:08:08 +0200
Subject: [Buildroot] [PATCH v2 3/3] support/config-fragments: use
 external riscv64 musl toolchain
In-Reply-To: <20200510154347.5711-3-mark@dibsco.co.uk>
References: <20200510154347.5711-1-mark@dibsco.co.uk>
 <20200510154347.5711-3-mark@dibsco.co.uk>
Message-ID: <20200727210808.42f5716b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 10 May 2020 16:43:47 +0100
Mark Corbin <mark@dibsco.co.uk> wrote:

> Move to an external RISC-V 64 bit musl toolchain to ease the load
> on the autobuilders.
> 
> Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
> ---
>  .../autobuild/br-riscv64-internal-musl.config            | 3 ---
>  .../config-fragments/autobuild/br-riscv64-musl.config    | 9 +++++++++
>  2 files changed, 9 insertions(+), 3 deletions(-)
>  delete mode 100644 support/config-fragments/autobuild/br-riscv64-internal-musl.config
>  create mode 100644 support/config-fragments/autobuild/br-riscv64-musl.config

Here as well, you had forgotten to update
support/config-fragments/autobuild/toolchain-configs.csv, so I did that
when applying. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

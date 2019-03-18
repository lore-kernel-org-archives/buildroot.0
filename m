From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Mar 2019 22:59:27 +0100
Subject: [Buildroot] [PATCH v2 1/5] package/glibc: Update glibc 32-bit
 RISC-V version
In-Reply-To: <20190318210106.6347-1-alistair.francis@wdc.com>
References: <20190318210106.6347-1-alistair.francis@wdc.com>
Message-ID: <20190318225927.714dab16@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 18 Mar 2019 21:02:02 +0000
Alistair Francis <Alistair.Francis@wdc.com> wrote:

> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  .../glibc.hash                                |  2 +-
>  ...C-V-32-bit-build-of-riscv-glibc-2.26.patch | 59 -------------------
>  ...rror-that-breaks-RISC-V-architecture.patch | 39 ------------
>  package/glibc/glibc.mk                        |  2 +-
>  4 files changed, 2 insertions(+), 100 deletions(-)
>  rename package/glibc/{4e2943456e690d89f48e6e710757dd09404b0c9a => 06983fe52cfe8e4779035c27e8cc5d2caab31531}/glibc.hash (71%)
>  delete mode 100644 package/glibc/4e2943456e690d89f48e6e710757dd09404b0c9a/0001-Fix-RISC-V-32-bit-build-of-riscv-glibc-2.26.patch
>  delete mode 100644 package/glibc/4e2943456e690d89f48e6e710757dd09404b0c9a/0002-Fix-mcontext_t-error-that-breaks-RISC-V-architecture.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

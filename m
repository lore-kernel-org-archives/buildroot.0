From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Sep 2018 17:22:26 +0200
Subject: [Buildroot] [PATCH 1/2] package/gdb: move patch directory
In-Reply-To: <20180909163750.14196-1-romain.naour@gmail.com>
References: <20180909163750.14196-1-romain.naour@gmail.com>
Message-ID: <20180910172226.3f9cab12@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  9 Sep 2018 18:37:49 +0200, Romain Naour wrote:
> commit 9cf4964da56863dfe4ce729c32400bd9acf25ee7 forgot to move patch directory.
> 
> Fixes:
> https://gitlab.com/free-electrons/toolchains-builder/-/jobs/95552306
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  .../0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch       | 0
>  .../0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch       | 0
>  package/gdb/{8.1 => 8.1.1}/0003-use-asm-sgidefs.h.patch                   | 0
>  package/gdb/{8.1 => 8.1.1}/0004-gdbserver-fix-build-for-m68k.patch        | 0
>  .../{8.1 => 8.1.1}/0005-nat-fork-inferior-include-linux-ptrace.h.patch    | 0
>  5 files changed, 0 insertions(+), 0 deletions(-)
>  rename package/gdb/{8.1 => 8.1.1}/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch (100%)
>  rename package/gdb/{8.1 => 8.1.1}/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch (100%)
>  rename package/gdb/{8.1 => 8.1.1}/0003-use-asm-sgidefs.h.patch (100%)
>  rename package/gdb/{8.1 => 8.1.1}/0004-gdbserver-fix-build-for-m68k.patch (100%)
>  rename package/gdb/{8.1 => 8.1.1}/0005-nat-fork-inferior-include-linux-ptrace.h.patch (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

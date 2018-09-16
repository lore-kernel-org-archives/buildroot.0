From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Sep 2018 16:10:51 +0200
Subject: [Buildroot] [PATCH 1/2] package/gdb: bump to version 8.2
In-Reply-To: <20180914214815.16795-1-romain.naour@gmail.com>
References: <20180914214815.16795-1-romain.naour@gmail.com>
Message-ID: <20180916161051.028d8b96@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 14 Sep 2018 23:48:14 +0200, Romain Naour wrote:
> Rebase existing patches on gdb 8.2.
> 
> https://sourceware.org/ml/gdb-announce/2018/msg00003.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  ...Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch |  55 +++++++
>  ...efine-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch |  43 +++++
>  package/gdb/8.2/0003-use-asm-sgidefs.h.patch       |  40 +++++
>  .../8.2/0004-gdbserver-fix-build-for-m68k.patch    |  62 +++++++
>  ...-nat-fork-inferior-include-linux-ptrace.h.patch |  51 ++++++
>  ...ular_file-from-common-utils.c-to-filestuf.patch | 179 +++++++++++++++++++++
>  package/gdb/Config.in.host                         |   7 +
>  package/gdb/gdb.hash                               |   1 +
>  8 files changed, 438 insertions(+)
>  create mode 100644 package/gdb/8.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
>  create mode 100644 package/gdb/8.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
>  create mode 100644 package/gdb/8.2/0003-use-asm-sgidefs.h.patch
>  create mode 100644 package/gdb/8.2/0004-gdbserver-fix-build-for-m68k.patch
>  create mode 100644 package/gdb/8.2/0005-nat-fork-inferior-include-linux-ptrace.h.patch
>  create mode 100644 package/gdb/8.2/0006-Move-is_regular_file-from-common-utils.c-to-filestuf.patch

Both applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

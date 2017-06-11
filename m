From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 18:10:43 +0200
Subject: [Buildroot] [PATCH] package/gdb: add support for gdb 8.0
In-Reply-To: <20170605204648.11780-1-romain.naour@gmail.com>
References: <20170605204648.11780-1-romain.naour@gmail.com>
Message-ID: <20170611181043.0de6329f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  5 Jun 2017 22:46:48 +0200, Romain Naour wrote:
> Add a dependency on gcc >= 4.8 since gdb needs a C++11 compiler.
> 
> Remove included patch since 7.12.1:
> 0001-Remove-const-in-xtensa-linux-nat.c-fetch_gregs.patch
> https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=d274ecf4ddf76768af57e27f654b9ce6784b391c
> 
> Rebase remaining patches:
> 0002-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
> 0003-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
> 
> See https://sourceware.org/ml/gdb-announce/2017/msg00003.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> This patch is rebased after [1], [2] and [3]

Applied to master, thanks. Do you intend to send a patch that updates
the default gdb version to 7.12, and drop support for 7.10 ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

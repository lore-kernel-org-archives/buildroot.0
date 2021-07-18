From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 13:54:47 +0200
Subject: [Buildroot] [PATCHv2] package/gdb: enable gdbserver support for
 riscv
In-Reply-To: <20210617214213.75840-1-romain.naour@gmail.com>
References: <20210617214213.75840-1-romain.naour@gmail.com>
Message-ID: <20210718135447.4896c3ee@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 17 Jun 2021 23:42:13 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> It turn out that gdbserver support for riscv is available since 10.1 release, since commit [1].
> 
> Restrict the gdb version choice for riscv to 10.1 for simplicity [2].
> 
> [1] https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=bf84f7066626c78884436e1c39fb60f04c665f21
> [2] http://lists.busybox.net/pipermail/buildroot/2021-June/312681.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Alistair Francis <alistair.francis@wdc.com>
> ---
> git tag --contains bf84f7066626c78884436e1c39fb60f04c665f21
> returns gdb-10.1-release tag as the oldest containing this commit.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

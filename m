From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Jun 2020 23:02:16 +0200
Subject: [Buildroot] [PATCH] strace: bump to version 5.7
In-Reply-To: <4f8ce0c199f730641f988fbc2841c3145b9fa759.1591267219.git.baruch@tkos.co.il>
References: <4f8ce0c199f730641f988fbc2841c3145b9fa759.1591267219.git.baruch@tkos.co.il>
Message-ID: <20200604230216.02dc458a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  4 Jun 2020 13:40:19 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

> Drop upstream patch.
> 
> Fixes:
> http://autobuild.buildroot.net/results/ca298d6543c07efbf77f2adeb4832bbac00ae73f/
> http://autobuild.buildroot.net/results/f26a4f2bb5a9b25739e55be5e5ded2b83a0937ac/
> http://autobuild.buildroot.net/results/53d6dac4047742ae2acd682a0dd97d986ba611bb/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> The build issue affects 2020.05 as well.

And 2020.02 ?

> ---
>  ...yscall_info.c-fix-build-without-fork.patch | 56 -------------------
>  package/strace/strace.hash                    |  4 +-
>  package/strace/strace.mk                      |  2 +-
>  3 files changed, 3 insertions(+), 59 deletions(-)
>  delete mode 100644 package/strace/0001-ptrace_syscall_info.c-fix-build-without-fork.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

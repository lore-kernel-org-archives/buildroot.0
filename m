From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Sep 2020 09:11:49 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/uclibc: bump version to
 1.0.35
In-Reply-To: <20200903155728.19448-1-petr.vorel@gmail.com>
References: <20200903155728.19448-1-petr.vorel@gmail.com>
Message-ID: <20200904091149.4e43f19e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  3 Sep 2020 17:57:27 +0200
Petr Vorel <petr.vorel@gmail.com> wrote:

> Drop patch from this release.
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  ...ude-hi-and-lo-in-__SYSCALL_CLOBBERS-.patch | 68 -------------------
>  package/uclibc/uclibc.hash                    |  4 +-
>  package/uclibc/uclibc.mk                      |  2 +-
>  3 files changed, 3 insertions(+), 71 deletions(-)
>  delete mode 100644 package/uclibc/0001-mips-Do-not-include-hi-and-lo-in-__SYSCALL_CLOBBERS-.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 May 2020 21:36:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/ltp-testsuite: bump to version
 20200515
In-Reply-To: <20200515145344.13370-1-petr.vorel@gmail.com>
References: <20200515145344.13370-1-petr.vorel@gmail.com>
Message-ID: <20200515213616.31841d4c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 15 May 2020 16:53:44 +0200
Petr Vorel <petr.vorel@gmail.com> wrote:

> Also update list of tests incompatible with musl.
> Removed patch backported from this release.
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  ...64-unsafe-syscalls-before-using-them.patch | 123 ------------------
>  package/ltp-testsuite/ltp-testsuite.hash      |   4 +-
>  package/ltp-testsuite/ltp-testsuite.mk        |  10 +-
>  3 files changed, 3 insertions(+), 134 deletions(-)
>  delete mode 100644 package/ltp-testsuite/0001-syscalls-Check-for-time64-unsafe-syscalls-before-using-them.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

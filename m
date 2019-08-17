From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Aug 2019 15:06:40 +0200
Subject: [Buildroot] [PATCH: for-next] package/glibc: bump to version
 2.30
In-Reply-To: <20190816150752.5716-1-romain.naour@gmail.com>
References: <20190816150752.5716-1-romain.naour@gmail.com>
Message-ID: <20190817150640.4e62b141@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 16 Aug 2019 17:07:52 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> With Glibc 2.30, GCC 6.2 or later is required to build the GNU C
> Library. Disable Glibc for GCC 5.x.
> 
> CVE-2019-7309, CVE-2019-9169.
> 
> See:
> https://sourceware.org/ml/libc-alpha/2019-08/msg00029.html
> 
> Tested with toolchain-builder:
> https://gitlab.com/kubu93/toolchains-builder/pipelines/76423684
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
> There is an existing issue with Qemu 2.11 on powerpc64.
> ---
>  package/gcc/Config.in.host                                    | 4 ++--
>  .../glibc.hash                                                | 2 +-
>  package/glibc/glibc.mk                                        | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
>  rename package/glibc/{2.29-30-g2d3fefd7ce64ac1015701c96916fffacc073a877 => 2.30-1-gbe9a328c93834648e0bec106a1f86357d1a8c7e1}/glibc.hash (70%)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

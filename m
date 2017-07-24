From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jul 2017 17:57:27 +0200
Subject: [Buildroot] [PATCH 1/1] xvisor: bump version to 0.29
In-Reply-To: <20170723160547.14988-1-eric.le.bihan.dev@free.fr>
References: <20170723160547.14988-1-eric.le.bihan.dev@free.fr>
Message-ID: <20170724175727.1c38b613@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 23 Jul 2017 18:05:47 +0200, Eric Le Bihan wrote:
> Bump version to 0.29, drop deprecated patch and update dependencies.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  .../0001-Makefile-Fix-oldconfig-make-target.patch  | 30 -----------
>  .../xvisor/0002-openconf-do-not-check-stdin.patch  | 58 ----------------------
>  package/xvisor/xvisor.hash                         |  2 +-
>  package/xvisor/xvisor.mk                           |  3 +-
>  4 files changed, 3 insertions(+), 90 deletions(-)
>  delete mode 100644 package/xvisor/0001-Makefile-Fix-oldconfig-make-target.patch
>  delete mode 100644 package/xvisor/0002-openconf-do-not-check-stdin.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 16:01:08 +0200
Subject: [Buildroot] [PATCH] package.bison: fix build on host with
 glibc-2.28
In-Reply-To: <20180819165931.23259-1-yann.morin.1998@free.fr>
References: <20180819165931.23259-1-yann.morin.1998@free.fr>
Message-ID: <20180820160108.3e3ee9fc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Aug 2018 18:59:31 +0200, Yann E. MORIN wrote:
> Similarly to c48f8a6462 (package/m4: fix build on host with glibc-2.28),
> backport the two fixes fromn gnulib upstream, that allows building
> host-bison on systems using glibc 2.28.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Reported-by: c32 on IRC
> ---
>  ...lush-adjust-to-glibc-2.28-libio.h-removal.patch | 50 ++++++++++++++++++++++
>  ...ush-be-more-paranoid-about-libio.h-change.patch | 46 ++++++++++++++++++++
>  2 files changed, 96 insertions(+)
>  create mode 100644 package/bison/0001-fflush-adjust-to-glibc-2.28-libio.h-removal.patch
>  create mode 100644 package/bison/0002-fflush-be-more-paranoid-about-libio.h-change.patch

Applied to master after fixing the typo in the commit title. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 10:10:30 +0100
Subject: [Buildroot] [PATCH 2/3] package/netbsd-queue: add Kconfig
 symbol like for all target packages
In-Reply-To: <bdbd50f9cea9eeeca54950f0cc9897156bb0ae0e.1451430505.git.yann.morin.1998@free.fr>
References: <cover.1451430505.git.yann.morin.1998@free.fr>
 <bdbd50f9cea9eeeca54950f0cc9897156bb0ae0e.1451430505.git.yann.morin.1998@free.fr>
Message-ID: <20151230101030.0628c3ac@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 30 Dec 2015 00:10:39 +0100, Yann E. MORIN wrote:
> Select that package from musl, too, since it is a dependency.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/15c/15c9a80fb2754ed1866b59d5e62d02691b57834e/
>     ... and numerous similar issues ...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Sergio Prado <sergio.prado@e-labworks.com>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> 
> ---
> Conflicts:
> 	package/musl/Config.in
> ---
>  package/musl/Config.in         | 1 +
>  package/netbsd-queue/Config.in | 2 ++
>  2 files changed, 3 insertions(+)
>  create mode 100644 package/netbsd-queue/Config.in

I've applied, but I realized afterwards that you forgot the external
toolchain case, so I did a follow-up commit to fix this case as well.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

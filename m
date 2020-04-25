From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 14:57:44 +0200
Subject: [Buildroot] [PATCH 1/8] core/show-info: do not show install
 types for host packages
In-Reply-To: <c714f1890e448d102aaef9eaf2f2d286df265c85.1586592741.git.yann.morin.1998@free.fr>
References: <cover.1586592741.git.yann.morin.1998@free.fr>
 <c714f1890e448d102aaef9eaf2f2d286df265c85.1586592741.git.yann.morin.1998@free.fr>
Message-ID: <20200425145744.496dd056@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 11 Apr 2020 10:12:26 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> By their very nature, host packages have no target, staging, or
> images install steps; they have a single install step, that is
> always performed.
> 
> However, we currently report those three types of install, which
> is misleading at best, and really incorrect.
> 
> If we were to report any install type for host package, that would
> be a single one, and it would always be true.
> 
> So, do not report any install type for host packages, as it does
> not make sense to report anything that is always true.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Vadim Kochan <vadim4j@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: eeppeliteloop at gmail.com
> ---
>  package/pkg-utils.mk | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

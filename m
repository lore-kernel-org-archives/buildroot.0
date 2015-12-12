From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Dec 2015 14:46:21 +0100
Subject: [Buildroot] [PATCH v9 04/32] package/{efl packages}: reorder
 select/depends
In-Reply-To: <1449927215-3452-5-git-send-email-romain.naour@openwide.fr>
References: <1449927215-3452-1-git-send-email-romain.naour@openwide.fr>
 <1449927215-3452-5-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151212144621.53f59411@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat, 12 Dec 2015 14:33:07 +0100, Romain Naour wrote:
> As noticed by Yann [1], move the package dependencies
> before selected packages/options.
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2015-October/142955.html
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
> v6: new patch
> ---
>  package/efl/libelementary/Config.in       |  4 ++--
>  package/enlightenment/Config.in           | 22 +++++++++++-----------
>  package/expedite/Config.in                |  6 +++---
>  package/libevas-generic-loaders/Config.in |  4 ++--
>  4 files changed, 18 insertions(+), 18 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

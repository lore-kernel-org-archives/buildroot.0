From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 10:15:03 +0200
Subject: [Buildroot] [PATCH 55/69] infra: remove auto derivation of host
 dependencies
In-Reply-To: <1467498098-23731-56-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
 <1467498098-23731-56-git-send-email-julien.floret@6wind.com>
Message-ID: <20160703101503.71509404@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  3 Jul 2016 00:21:24 +0200, Julien Floret wrote:
> This feature consists in automatically deducing dependencies of a host
> package from the dependencies of the target variant.
> 
> However, it causes some issues, and many host packages need different
> dependencies than their target variants.
> 
> Now that host dependencies are explicitly set for all packages, we can
> remove it.
> 
> Signed-off-by: Julien Floret <julien.floret@6wind.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/pkg-autotools.mk |  9 ---------
>  package/pkg-cmake.mk     |  7 -------
>  package/pkg-generic.mk   |  4 ----
>  package/pkg-python.mk    | 15 ---------------
>  package/pkg-rebar.mk     | 14 --------------
>  package/pkg-virtual.mk   |  7 -------
>  6 files changed, 56 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

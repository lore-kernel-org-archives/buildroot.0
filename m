From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Dec 2015 22:03:40 +0100
Subject: [Buildroot] [PATCH] package/netbsd-queue: fix circular
 dependency
In-Reply-To: <1450465304-679-1-git-send-email-yann.morin.1998@free.fr>
References: <1450465304-679-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20151218220340.0d47f847@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 18 Dec 2015 20:01:44 +0100, Yann E. MORIN wrote:
> netbsd-queue is a dependency of musl, so is part of the toolchain.
> As such, it should not depend on the toolchain...
> 
> Fixes make circular dependencies such as:
> 
>     make[1]: Circular toolchain-all-source <- toolchain-external-all-source
>     dependency dropped.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Sergio Prado <sergio.prado@e-labworks.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> ---
>  package/netbsd-queue/netbsd-queue.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

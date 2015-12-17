From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 22:05:18 +0100
Subject: [Buildroot] [PATCH] libtirpc: using sys/queue.h from staging
In-Reply-To: <1449068879-29945-1-git-send-email-sergio.prado@e-labworks.com>
References: <1449068879-29945-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <20151217220518.4ba77ecc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sergio Prado,

On Wed,  2 Dec 2015 13:07:59 -0200, Sergio Prado wrote:
> Now that musl toolchains depend on netbsd-queue package, a
> implementation of sys/queue.h will always be available in the
> staging directory, so we can remove the patch that adds a local
> sys/queue.h implementation.
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
>  ...006-Disable-DES-authentification-support.patch} |   0
>  package/libtirpc/0006-Use-local-bsdqueue.h.patch   | 903 ---------------------
>  ...-missing-rwlock_unlocks-in-xprt_register.patch} |   0
>  3 files changed, 903 deletions(-)
>  rename package/libtirpc/{0007-Disable-DES-authentification-support.patch => 0006-Disable-DES-authentification-support.patch} (100%)
>  delete mode 100644 package/libtirpc/0006-Use-local-bsdqueue.h.patch
>  rename package/libtirpc/{0008-Add-missing-rwlock_unlocks-in-xprt_register.patch => 0007-Add-missing-rwlock_unlocks-in-xprt_register.patch} (100%)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

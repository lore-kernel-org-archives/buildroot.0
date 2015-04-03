From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Apr 2015 14:26:47 +0200
Subject: [Buildroot] [PATCH] toolchains: remove non-LFS toolchain
In-Reply-To: <1428057549-24019-1-git-send-email-yann.morin.1998@free.fr>
References: <1428057549-24019-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150403142647.11bbc9bd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri,  3 Apr 2015 12:39:09 +0200, Yann E. MORIN wrote:
> Buildroot now requires toolchains to have LFS; it's no longer optional.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  web/toolchains/configs/br-powerpc-603e-basic-cpp.config | 9 ---------
>  1 file changed, 9 deletions(-)
>  delete mode 100644 web/toolchains/configs/br-powerpc-603e-basic-cpp.config

Thanks, applied. However, you forgot to also update the CSV file that
lists all toolchain (so I did that). And next time if you could
--subject-prefix="buildroot-test" or something like that, it would be
great, as it allows to more clearly distinguish such patches from real
Buildroot patches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

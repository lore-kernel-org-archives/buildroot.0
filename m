From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Aug 2014 15:01:25 +0200
Subject: [Buildroot] [PATCH] external toolchain: [ARC] gcc cpu parameter
In-Reply-To: <884EA965490E3C4D8E66AEF41E98025006BF3A@ezex10.ezchip.com>
References: <884EA965490E3C4D8E66AEF41E98025006BF3A@ezex10.ezchip.com>
Message-ID: <20140803150125.6f8621c5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Noam Camus,

On Sun, 23 Feb 2014 08:28:55 +0000, Noam Camus wrote:
> external toolchain passes -mcpu=arc700
> However compiler is familiar with -mcpu=ARC700
> 
> Signed-off-by: Noam Camus <noamc@ezchip.com>
> ---
>  arch/Config.in.arc |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/Config.in.arc b/arch/Config.in.arc index 60b59f0..53e7052 100644
> --- a/arch/Config.in.arc
> +++ b/arch/Config.in.arc
> @@ -11,4 +11,5 @@ config BR2_ENDIAN
>  	default "BIG"	 if BR2_arceb
>  
>  config BR2_GCC_TARGET_CPU
> +	default "ARC700" if BR2_TOOLCHAIN_EXTERNAL
>  	default "arc700"

Since there has been no feedback about this patch since February 2014,
I've marked it as Rejected in patchwork, as the proposed solution is
not acceptable. Do not hesitate to get back to us with a more
appropriate solution.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

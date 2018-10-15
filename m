From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 15 Oct 2018 21:19:18 +0200
Subject: [Buildroot] [PATCH 2/2] linux: bump default to version 4.18.14
In-Reply-To: <20181015172540.29664-2-bernd.kuhls@t-online.de>
References: <20181015172540.29664-1-bernd.kuhls@t-online.de>
 <20181015172540.29664-2-bernd.kuhls@t-online.de>
Message-ID: <20181015211918.57a23a32@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 15 Oct 2018 19:25:40 +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  linux/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index 235018ca0b..d372c2c1f8 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -120,7 +120,7 @@ endif
>  
>  config BR2_LINUX_KERNEL_VERSION
>  	string
> -	default "4.18.10" if BR2_LINUX_KERNEL_LATEST_VERSION
> +	default "4.18.14" if BR2_LINUX_KERNEL_LATEST_VERSION

You cannot change this without changing linux.hash at the same time.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

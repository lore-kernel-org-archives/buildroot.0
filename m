From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 6 Jun 2018 21:55:32 +0200
Subject: [Buildroot] [PATCH] bump 3.2.x and 4.{4, 9, 14, 16}.x series
In-Reply-To: <1528247080-7847-1-git-send-email-festevam@gmail.com>
References: <1528247080-7847-1-git-send-email-festevam@gmail.com>
Message-ID: <20180606215532.1eb9e5c5@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabio,

patch subject should be 'linux-heades: bump 3.2.x and 4.{4, 9, 14, 16}.x series'
(with package prefix)...

Regards,
Peter

On Tue,  5 Jun 2018 22:04:40 -0300, Fabio Estevam <festevam@gmail.com> wrote:

> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  package/linux-headers/Config.in.host | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index f6229c0..f56d85b 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -256,16 +256,16 @@ endchoice
>  
>  config BR2_DEFAULT_KERNEL_HEADERS
>  	string
> -	default "3.2.101"	if BR2_KERNEL_HEADERS_3_2
> +	default "3.2.102"	if BR2_KERNEL_HEADERS_3_2
>  	default "4.1.52"	if BR2_KERNEL_HEADERS_4_1
> -	default "4.4.134"	if BR2_KERNEL_HEADERS_4_4
> -	default "4.9.104"	if BR2_KERNEL_HEADERS_4_9
> +	default "4.4.135"	if BR2_KERNEL_HEADERS_4_4
> +	default "4.9.106"	if BR2_KERNEL_HEADERS_4_9
>  	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
>  	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
>  	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
>  	default "4.13.16"	if BR2_KERNEL_HEADERS_4_13
> -	default "4.14.46"	if BR2_KERNEL_HEADERS_4_14
> +	default "4.14.48"	if BR2_KERNEL_HEADERS_4_14
>  	default "4.15.18"	if BR2_KERNEL_HEADERS_4_15
> -	default "4.16.13"	if BR2_KERNEL_HEADERS_4_16
> +	default "4.16.14"	if BR2_KERNEL_HEADERS_4_16
>  	default "4.17"		if BR2_KERNEL_HEADERS_4_17
>  	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION

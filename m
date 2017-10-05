From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 5 Oct 2017 20:28:49 +0200
Subject: [Buildroot] [PATCH 1/2] linux-headers: bump 4.{4, 9,
	13}.x series
In-Reply-To: <20171005173007.15974-1-bernd.kuhls@t-online.de>
References: <20171005173007.15974-1-bernd.kuhls@t-online.de>
Message-ID: <a945e6ba-e344-5101-9d21-17a4f095d3d2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-10-17 19:30, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 Both applied to master, thanks!

 Regards,
 Arnout

> ---
>  package/linux-headers/Config.in.host | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index ff9c0d2a24..9e1a77f533 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -244,10 +244,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
>  	default "3.10.107"	if BR2_KERNEL_HEADERS_3_10
>  	default "3.12.74"	if BR2_KERNEL_HEADERS_3_12
>  	default "4.1.43"	if BR2_KERNEL_HEADERS_4_1
> -	default "4.4.89"	if BR2_KERNEL_HEADERS_4_4
> -	default "4.9.52"	if BR2_KERNEL_HEADERS_4_9
> +	default "4.4.90"	if BR2_KERNEL_HEADERS_4_4
> +	default "4.9.53"	if BR2_KERNEL_HEADERS_4_9
>  	default "4.10.17"	if BR2_KERNEL_HEADERS_4_10
>  	default "4.11.12"	if BR2_KERNEL_HEADERS_4_11
>  	default "4.12.14"	if BR2_KERNEL_HEADERS_4_12
> -	default "4.13.4"	if BR2_KERNEL_HEADERS_4_13
> +	default "4.13.5"	if BR2_KERNEL_HEADERS_4_13
>  	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

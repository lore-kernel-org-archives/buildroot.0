From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 Jul 2016 16:22:01 +0200
Subject: [Buildroot] [PATCH 2/4] linux-headers: indent custom choices
In-Reply-To: <1461099155-30702-3-git-send-email-vivien.didelot@savoirfairelinux.com>
References: <1461099155-30702-1-git-send-email-vivien.didelot@savoirfairelinux.com>
 <1461099155-30702-3-git-send-email-vivien.didelot@savoirfairelinux.com>
Message-ID: <20160701142201.GE25487@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vivien, All,

On 2016-04-19 16:52 -0400, Vivien Didelot spake thusly:
> Fix the indentation of config entries in the "Custom kernel headers
> series" choice menu.

After the comments by Arnout and Thomas, and your further feedback, I've
marked this patch as rejected in out patchwork.

Regards,
Yann E. MORIN.

> Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> ---
>  package/linux-headers/Config.in.host | 160 +++++++++++++++++------------------
>  1 file changed, 80 insertions(+), 80 deletions(-)
> 
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index 9f80224..6d86113 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -99,112 +99,112 @@ choice
>  	  This is used to hide/show some packages that have strict
>  	  requirements on the version of kernel headers.
>  
> -config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5
> -	bool "4.5.x"
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
> +	config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5
> +		bool "4.5.x"
> +		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
>  
> -config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4
> -	bool "4.4.x"
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
> +	config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4
> +		bool "4.4.x"
> +		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
>  
> -config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3
> -	bool "4.3.x"
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
> +	config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3
> +		bool "4.3.x"
> +		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
>  
> -config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2
> -	bool "4.2.x"
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2
> +	config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2
> +		bool "4.2.x"
> +		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2
>  
> -config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1
> -	bool "4.1.x"
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_1
> +	config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1
> +		bool "4.1.x"
> +		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_1
>  
> -config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_0
> -	bool "4.0.x"
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
> +	config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_0
> +		bool "4.0.x"
> +		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
>  
> -config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19
> -	bool "3.19.x"
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19
> +	config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19
> +		bool "3.19.x"
> +		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19
>  
> -config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18
> -	bool "3.18.x"
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
> +	config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18
> +		bool "3.18.x"
> +		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
>  
> -config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_17
> -	bool "3.17.x"
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
> +	config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_17
> +		bool "3.17.x"
> +		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
>  
> -config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_16
> -	bool "3.16.x"
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
> +	config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_16
> +		bool "3.16.x"
> +		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
>  
> -config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_15
> -	bool "3.15.x"
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
> +	config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_15
> +		bool "3.15.x"
> +		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
>  
> -config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14
> -	bool "3.14.x"
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
> +	config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14
> +		bool "3.14.x"
> +		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
>  
> -config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_13
> -	bool "3.13.x"
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
> +	config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_13
> +		bool "3.13.x"
> +		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
>  
> -config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_12
> -	bool "3.12.x"
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
> +	config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_12
> +		bool "3.12.x"
> +		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
>  
> -config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_11
> -	bool "3.11.x"
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11
> +	config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_11
> +		bool "3.11.x"
> +		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11
>  
> -config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10
> -	bool "3.10.x"
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
> +	config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10
> +		bool "3.10.x"
> +		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
>  
> -config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_9
> -	bool "3.9.x"
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
> +	config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_9
> +		bool "3.9.x"
> +		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_9
>  
> -config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_8
> -	bool "3.8.x"
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8
> +	config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_8
> +		bool "3.8.x"
> +		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8
>  
> -config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_7
> -	bool "3.7.x"
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
> +	config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_7
> +		bool "3.7.x"
> +		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
>  
> -config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_6
> -	bool "3.6.x"
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_6
> +	config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_6
> +		bool "3.6.x"
> +		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_6
>  
> -config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_5
> -	bool "3.5.x"
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
> +	config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_5
> +		bool "3.5.x"
> +		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
>  
> -config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_4
> -	bool "3.4.x"
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
> +	config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_4
> +		bool "3.4.x"
> +		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
>  
> -config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_3
> -	bool "3.3.x"
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
> +	config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_3
> +		bool "3.3.x"
> +		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
>  
> -config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_2
> -	bool "3.2.x"
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
> +	config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_2
> +		bool "3.2.x"
> +		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
>  
> -config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_1
> -	bool "3.1.x"
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
> +	config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_1
> +		bool "3.1.x"
> +		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
>  
> -config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_0
> -	bool "3.0.x"
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
> +	config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_0
> +		bool "3.0.x"
> +		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
>  
> -config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_REALLY_OLD
> -	bool "2.6.x"
> +	config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_REALLY_OLD
> +		bool "2.6.x"
>  
>  endchoice
>  
> -- 
> 2.8.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

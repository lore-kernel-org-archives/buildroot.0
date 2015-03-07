From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 7 Mar 2015 15:34:52 +0100
Subject: [Buildroot] [PATCH 2/3] uclibc: remove bogus comment about
 thread implementation selection
In-Reply-To: <1425735600-16762-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1425735600-16762-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1425735600-16762-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150307143452.GD4186@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-03-07 14:39 +0100, Thomas Petazzoni spake thusly:
> There is no need to warn the user about selecting an inappropriate
> thread implementation, since we make sure only supported combinations
> can be selected.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/uclibc/Config.in | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
> index c66373d..1839d65 100644
> --- a/package/uclibc/Config.in
> +++ b/package/uclibc/Config.in
> @@ -133,10 +133,7 @@ choice
>  	default BR2_PTHREADS if BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS
>  	help
>  	  Use this option to select the thread library implementation
> -	  that should be used in your toolchain. Not all thread
> -	  variants work with all versions of uClibc, the "linuxthreads
> -	  (stable/old)" may be a working fallback if you need
> -	  threading at all.
> +	  that should be used in your toolchain.
>  
>  	config BR2_PTHREADS_NONE
>  		bool "none"
> -- 
> 2.1.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jun 2015 11:31:56 +0200
Subject: [Buildroot] [PATCH 1/2] uclibc: use uClibc-ng by default
In-Reply-To: <1434216106-27618-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1434216106-27618-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150614093155.GA3615@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-06-13 19:21 +0200, Thomas Petazzoni spake thusly:
> Since the uClibc project is not making any release since about 3
> years, and the uClibc-ng project is now alive and delivering regular
> releases based on uClibc master plus a number of fixes, let's make
> uClibc-ng the default uClibc version used by Buildroot.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Waldemar Brodkorb <wbx@openadk.org>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/uclibc/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
> index dd23853..9b29ae5 100644
> --- a/package/uclibc/Config.in
> +++ b/package/uclibc/Config.in
> @@ -18,7 +18,7 @@ config BR2_UCLIBC_VERSION_SUPPORTS_NPTL
>  
>  choice
>  	prompt "uClibc C library Version"
> -	default BR2_UCLIBC_VERSION_0_9_33
> +	default BR2_UCLIBC_VERSION_NG
>  	help
>  	  Select the version of uClibc you wish to use.
>  
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

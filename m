From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Jun 2016 22:50:22 +0200
Subject: [Buildroot] [PATCH 6/6] rt-tests: remove occurrence of eglibc
In-Reply-To: <1465422059-22254-6-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1465422059-22254-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1465422059-22254-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160613205022.GH3786@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-06-08 23:40 +0200, Thomas Petazzoni spake thusly:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/rt-tests/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
> index 4c57c0f..96e0bad 100644
> --- a/package/rt-tests/Config.in
> +++ b/package/rt-tests/Config.in
> @@ -15,9 +15,9 @@ config BR2_PACKAGE_RT_TESTS
>  
>  	  Note that this package requires a toolchain built with the
>  	  NPTL implementation of the pthread API (this is always the
> -	  case with glibc/eglibc toolchains, but may not necessarily
> -	  be the case with uClibc toolchains, since the thread
> -	  implementation is configurable).
> +	  case with glibc toolchains, but may not necessarily be the
> +	  case with uClibc toolchains, since the thread implementation
> +	  is configurable).
>  
>  	  http://rt.wiki.kernel.org
>  
> -- 
> 2.7.4
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

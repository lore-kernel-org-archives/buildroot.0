From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 27 Sep 2012 21:20:01 +0200
Subject: [Buildroot] [PATCH v3] external-toolchain:
	BR2_TOOLCHAIN_EXTERNAL_GLIBC includes eglibc
In-Reply-To: <1348773014-19000-1-git-send-email-baruch@tkos.co.il>
References: <1348773014-19000-1-git-send-email-baruch@tkos.co.il>
Message-ID: <201209272120.01265.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On Thursday 27 September 2012 21:10:14 Baruch Siach wrote:
> Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v3: rephrase the help text to make it clear that the eglibc build is given,
>     address the comment of Thomas Petazzoni.
[--SNIP--]
>  config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC
> -	bool "glibc"
> +	bool "glibc/eglibc"
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> +	help
> +	  Note: eglibc is a variant of glibc that (among other things) can be
> +	  configured to exclude parts of its features. This capability is 
> +	  currently not supported.

Yes, that is very good!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

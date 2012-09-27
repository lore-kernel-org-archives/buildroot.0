From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 27 Sep 2012 23:06:31 +0200
Subject: [Buildroot] [PATCH v4] external-toolchain:
	BR2_TOOLCHAIN_EXTERNAL_GLIBC includes eglibc
In-Reply-To: <1348774062-23946-1-git-send-email-baruch@tkos.co.il>
References: <1348774062-23946-1-git-send-email-baruch@tkos.co.il>
Message-ID: <201209272306.31518.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On Thursday 27 September 2012 21:27:42 Baruch Siach wrote:
> v4: now actually commit the rephrased text.
[--SNIP--]
>  config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC
> -	bool "glibc"
> +	bool "glibc/eglibc"
>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> +	help
> +	  Note: eglibc is a variant of glibc that (among other things) can be
> +	  configured to exclude some of its features. Using a toolchain with
> +	  eglibc configured to exclude key features may cause build failures to
> +	  some packages.

Well, that's even better! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 26 Dec 2018 10:33:15 +0100
Subject: [Buildroot] [PATCH 5/5 v5] boot/systemd-boot: new package
In-Reply-To: <d38239f86f99924e87dcb6e045b2de3ac0cb435f.1545814334.git.yann.morin.1998@free.fr>
References: <cover.1545814334.git.yann.morin.1998@free.fr>
 <d38239f86f99924e87dcb6e045b2de3ac0cb435f.1545814334.git.yann.morin.1998@free.fr>
Message-ID: <20181226093315.GD14286@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2018-12-26 09:52 +0100, Yann E. MORIN spake thusly:
[--SNIP--]
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index 50d09b34a5..a99358fc7b 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -101,9 +101,9 @@ config BR2_PACKAGE_SYSTEMD_BOOT
>  
>  config BR2_PACKAGE_SYSTEMD_BOOT_EFI_ARCH
>  	string
> -	depends on BR2_PACKAGE_SYSTEMD_BOOT
>  	default "ia32"  if BR2_i386
>  	default "x64"   if BR2_x86_64
> +	depends on BR2_PACKAGE_SYSTEMD_BOOT

Woops... I git-commit-fixup'ed the wrong commit...

I'll wait for other comments before respinning, unless the proper fixup
is done when applying; just say.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 1 Oct 2020 22:04:15 +0200
Subject: [Buildroot] [PATCH] boot/barebox: bump version to 2020.09.0
In-Reply-To: <20201001192911.501784-1-b.bilas@grinn-global.com>
References: <20201001192911.501784-1-b.bilas@grinn-global.com>
Message-ID: <20201001200415.GF11621@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bartosz, All,

On 2020-10-01 21:29 +0200, Bartosz Bilas spake thusly:
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  boot/barebox/Config.in    | 4 ++--
>  boot/barebox/barebox.hash | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
> index 9948a249a0..3b354e64d0 100644
> --- a/boot/barebox/Config.in
> +++ b/boot/barebox/Config.in
> @@ -12,7 +12,7 @@ choice
>  	  Select the specific Barebox version you want to use
>  
>  config BR2_TARGET_BAREBOX_LATEST_VERSION
> -	bool "2020.08.1"
> +	bool "2020.09.0"
>  
>  config BR2_TARGET_BAREBOX_CUSTOM_VERSION
>  	bool "Custom version"
> @@ -40,7 +40,7 @@ endif
>  
>  config BR2_TARGET_BAREBOX_VERSION
>  	string
> -	default "2020.08.1"	if BR2_TARGET_BAREBOX_LATEST_VERSION
> +	default "2020.09.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
>  	default BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE if BR2_TARGET_BAREBOX_CUSTOM_VERSION
>  	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
>  	default BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
> diff --git a/boot/barebox/barebox.hash b/boot/barebox/barebox.hash
> index 4bccdf9e03..77c75b6b5b 100644
> --- a/boot/barebox/barebox.hash
> +++ b/boot/barebox/barebox.hash
> @@ -1,8 +1,8 @@
> -# From https://www.barebox.org/download/barebox-2020.08.1.tar.bz2.md5
> -md5  d57031878390cb267f6641aedffcda9f  barebox-2020.08.1.tar.bz2
> +# From https://www.barebox.org/download/barebox-2020.09.0.tar.bz2.md5
> +md5  907dc813298fcded06fa9c788d3fb6c8  barebox-2020.09.0.tar.bz2
>  
>  # Locally calculated
> -sha256  8e6d413f1083ae0974b11a381369a3bac83e798a99830a1de128c950fef047e6  barebox-2020.08.1.tar.bz2
> +sha256  aad3b0736aa8d368d185736260d81fb3785251f376897be3cec745182fd51869  barebox-2020.09.0.tar.bz2
>  
>  # License files, locally computed
>  sha256  ab1122aa9f9073ad1ec824edcd970b16a6a7881a34a18fd56c080debb2dca5d4  COPYING
> -- 
> 2.28.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

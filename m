From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Jan 2014 18:19:46 +0100
Subject: [Buildroot] [PATCH 1/1] Adding extlinux to sysliux binaries
 copied into target/images.
In-Reply-To: <20140105122039.GA4201@zelow.no>
References: <20140105122039.GA4201@zelow.no>
Message-ID: <20140105171946.GD16066@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-01-05 13:20 +0100, Thomas Lundquist spake thusly:
[--SNIP--]
> diff --git a/boot/syslinux/Config.in b/boot/syslinux/Config.in
> index 2c39e65..5773abb 100644
> --- a/boot/syslinux/Config.in
> +++ b/boot/syslinux/Config.in
> @@ -17,4 +17,8 @@ config BR2_TARGET_SYSLINUX_PXELINUX
>  	bool "Install pxelinux"
>  	default y
>  
> +config BR2_TARGET_SYSLINUX_EXTLINUX
> +	bool "Install extlinux"
> +	default y

While you are working on syslinux, would you also consider adding the
MBR bootcode as an option, please?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

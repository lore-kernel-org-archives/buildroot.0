From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Mar 2016 23:57:59 +0100
Subject: [Buildroot] [PATCH] gptfdisk: indentation cleanup
In-Reply-To: <1457653095-27369-1-git-send-email-ricardo.martincoski@gmail.com>
References: <1457653095-27369-1-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <20160312225759.GK3745@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2016-03-10 20:38 -0300, Ricardo Martincoski spake thusly:
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/gptfdisk/Config.in.host | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/gptfdisk/Config.in.host b/package/gptfdisk/Config.in.host
> index fb7c682..1300d02 100644
> --- a/package/gptfdisk/Config.in.host
> +++ b/package/gptfdisk/Config.in.host
> @@ -2,10 +2,10 @@ config BR2_PACKAGE_HOST_GPTFDISK
>  	bool "host gptfdisk"
>  	select BR2_PACKAGE_HOST_UTIL_LINUX
>  	help
> -          GPT fdisk (consisting of the gdisk and sgdisk programs) is a
> -          text-mode partitioning tool that works on Globally Unique
> -          Identifier (GUID) Partition Table (GPT) disks, rather than
> -          on the more common (through 2010) Master Boot Record (MBR)
> -          partition tables.
> +	  GPT fdisk (consisting of the gdisk and sgdisk programs) is a
> +	  text-mode partitioning tool that works on Globally Unique
> +	  Identifier (GUID) Partition Table (GPT) disks, rather than
> +	  on the more common (through 2010) Master Boot Record (MBR)
> +	  partition tables.
>  
> -          http://www.rodsbooks.com/gdisk/
> +	  http://www.rodsbooks.com/gdisk/
> -- 
> 1.9.1
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

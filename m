From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Feb 2014 16:53:02 +0100
Subject: [Buildroot] [PATCH 11/13] docs/manual: refresh informations
 about *-menuconfig targets
In-Reply-To: <1393167879-16637-12-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1393167879-16637-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1393167879-16637-12-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140223155302.GK3342@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-02-23 16:04 +0100, Thomas Petazzoni spake thusly:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  docs/manual/make-tips.txt | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
> index 0159ffe..faf59f2 100644
> --- a/docs/manual/make-tips.txt
> +++ b/docs/manual/make-tips.txt
> @@ -32,10 +32,12 @@ The result of the search shows the help message of the matching items.
>  Not all targets are always available,
>  some settings in the +.config+ file may hide some targets:
>  
> +* +busybox-menuconfig+ and +busybox-savedefconfig+ ony work when
> +  +busybox+ is enabled;
>  * +linux-menuconfig+ and +linux-savedefconfig+ only work when
>    +linux+ is enabled;
> -* +uclibc-menuconfig+ is only available when the
> -  Buildroot internal toolchain backend is used;
> +* +uclibc-menuconfig+ is only available when the uClibc C library is
> +  selected in the internal toolchain backend;
>  * +barebox-menuconfig+ and +barebox-savedefconfig+ only work when the
>    +barebox+ bootloader is enabled.
>  
> -- 
> 1.8.3.2
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

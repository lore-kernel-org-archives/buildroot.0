From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Jan 2013 19:32:51 +0100
Subject: [Buildroot] [PATCH 4/5] docs/manual: no longer mention the
	package/customize thing
In-Reply-To: <1358363393-29977-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1358363393-29977-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1358363393-29977-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <201301251932.51950.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 16 January 2013 Thomas Petazzoni wrote:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> ---
>  docs/manual/customize-rootfs.txt |    6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.txt
> index 66e38dc..ce62412 100644
> --- a/docs/manual/customize-rootfs.txt
> +++ b/docs/manual/customize-rootfs.txt
> @@ -45,12 +45,6 @@ there are a few ways to customize the resulting target filesystem.
>        stored
>      - +BASE_DIR+: the base output directory
>  
> -* A special package, 'customize', stored in +package/customize+ can be
> -  used. You can put all the files that you want to see in the final
> -  target root filesystem in +package/customize/source+, and then
> -  enable this special package in the configuration system. _This
> -  method is marked as deprecated_.
> -
>  Note also that if want to perform some specific actions *after* all
>  filesystem images have been created (for example to automatically
>  extract your root filesystem tarball in a location exported by your
> -- 
> 1.7.9.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

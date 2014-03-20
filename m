From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 21 Mar 2014 00:16:14 +0100
Subject: [Buildroot] [PATCH 2/6] manual/customize-packages.txt: reword
 part about applying patches
In-Reply-To: <1395353250-9475-3-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1395353250-9475-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <1395353250-9475-3-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <20140320231614.GB20862@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jerzy, All,

On 2014-03-20 23:07 +0100, Jerzy Grzegorek spake thusly:
> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  docs/manual/customize-packages.txt |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/manual/customize-packages.txt b/docs/manual/customize-packages.txt
> index 5e622f1..f141b7e 100644
> --- a/docs/manual/customize-packages.txt
> +++ b/docs/manual/customize-packages.txt
> @@ -59,9 +59,9 @@ directory.
>  The exception to +BR2_GLOBAL_PATCH_DIR+ being the preferred method for
>  specifying custom patches is +BR2_LINUX_KERNEL_PATCH+.
>  +BR2_LINUX_KERNEL_PATCH+ should be used to specify kernel patches that
> -are available at an URL. *Note:* +BR2_LINUX_KERNEL_PATCHES+ are applied
> -after patches available in +BR2_GLOBAL_PATCH_DIR+, as it is done
> -from a post-patch hook of the Linux package.
> +are available at an URL. *Note:* +BR2_LINUX_KERNEL_PATCH+ specifies kernel
> +patches that are applied after patches available in +BR2_GLOBAL_PATCH_DIR+,
> +as it is done from a post-patch hook of the Linux package.
>  
>  An example directory structure for where a user has multiple
>  directories specified for +BR2_GLOBAL_PATCH_DIR+ may look like this:
> -- 
> 1.7.9.5
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

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jul 2016 15:35:07 +0200
Subject: [Buildroot] [PATCH] yasm: add license
In-Reply-To: <1467646410-19785-1-git-send-email-julien.floret@6wind.com>
References: <1467646410-19785-1-git-send-email-julien.floret@6wind.com>
Message-ID: <20160717133506.GE3614@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien, All,

On 2016-07-04 17:33 +0200, Julien Floret spake thusly:
> Signed-off-by: Julien Floret <julien.floret@6wind.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/yasm/yasm.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/yasm/yasm.mk b/package/yasm/yasm.mk
> index 6729b6a74dba..19800344299d 100644
> --- a/package/yasm/yasm.mk
> +++ b/package/yasm/yasm.mk
> @@ -6,6 +6,8 @@
>  
>  YASM_VERSION = 1.3.0
>  YASM_SITE = http://www.tortall.net/projects/yasm/releases
> +YASM_LICENSE = BSD-2c, BSD-3c, Artistic, GPLv2, LGPLv2
> +YASM_LICENSE_FILES = COPYING BSD.txt Artistic.txt GNU_GPL-2.0 GNU_LGPL-2.0
>  
>  # This sed prevents it compiling 2 programs (vsyasm and ytasm)
>  # that are only of use on Microsoft Windows.
> -- 
> 2.1.0
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

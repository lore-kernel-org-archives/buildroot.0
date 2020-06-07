From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Jun 2020 08:54:40 +0200
Subject: [Buildroot] [PATCH] gitlab-ci: regenerate after
 freescale_imx8mnevk_defconfig addition
In-Reply-To: <20200606215239.403537-1-romain.naour@gmail.com>
References: <20200606215239.403537-1-romain.naour@gmail.com>
Message-ID: <20200607065440.GJ13972@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2020-06-06 23:52 +0200, Romain Naour spake thusly:
> Fixes: 2c01eeece96ce449163e066566c787bfc2a10651
> 
> https://gitlab.com/buildroot.org/buildroot/-/jobs/584436394
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .gitlab-ci.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 66a679077c..f6eb7f6fe6 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -187,10 +187,10 @@ freescale_imx6sxsabresd_defconfig: { extends: .defconfig }
>  freescale_imx6ullevk_defconfig: { extends: .defconfig }
>  freescale_imx7dsabresd_defconfig: { extends: .defconfig }
>  freescale_imx8mmevk_defconfig: { extends: .defconfig }
> +freescale_imx8mnevk_defconfig: { extends: .defconfig }
>  freescale_imx8mqevk_defconfig: { extends: .defconfig }
>  freescale_imx8qmmek_defconfig: { extends: .defconfig }
>  freescale_imx8qxpmek_defconfig: { extends: .defconfig }
> -freescale_imx8mnevk_defconfig: { extends: .defconfig }
>  freescale_p1025twr_defconfig: { extends: .defconfig }
>  freescale_t1040d4rdb_defconfig: { extends: .defconfig }
>  freescale_t2080_qds_rdb_defconfig: { extends: .defconfig }
> -- 
> 2.25.4
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

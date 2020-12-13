From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Dec 2020 22:18:08 +0100
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: drop ti-sgx-libgbm
In-Reply-To: <20201213211117.300869-1-fontaine.fabrice@gmail.com>
References: <20201213211117.300869-1-fontaine.fabrice@gmail.com>
Message-ID: <20201213211808.GH3281876@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-12-13 22:11 +0100, Fabrice Fontaine spake thusly:
> Commit 814bfc5ec1ab49188d1c8cb7f0d8d857b92d6a03 forgot to drop
> ti-sgx-libgbm from DEVELOPERS

ARg, damned... Thanks!

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 73a27a3dd7..e77bcabe02 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1507,7 +1507,6 @@ F:	configs/bananapi_m2_ultra_defconfig
>  F:	configs/beaglebone_defconfig
>  F:	configs/beaglebone_qt5_defconfig
>  F:	package/ti-sgx-demos/
> -F:	package/ti-sgx-libgbm/
>  F:	package/ti-sgx-km/
>  F:	package/ti-sgx-um/
>  
> -- 
> 2.29.2
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

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 31 Dec 2019 16:23:31 +0100
Subject: [Buildroot] [PATCH] DEVELOPERS: add Lothar Felten as contact
 for BeagleBone defconfigs
In-Reply-To: <20190811120739.26539-17-thomas.petazzoni@bootlin.com>
References: <20190811120739.26539-17-thomas.petazzoni@bootlin.com>
Message-ID: <20191231152331.GK26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-08-11 14:07 +0200, Thomas Petazzoni spake thusly:
> Lothar added the beaglebone and beaglebone_qt5 defconfigs, and has
> been regularly maintaining them, so it makes sense to have him listed
> as a contact for those two defconfigs.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Lothar Felten <lothar.felten@gmail.com>

Applied to master, thanks.

> ---
> Lothar, could you reply with an Acked-by if you are fine with this?
> Thanks!

Lothar, we really need people to take care of the defconfigs, at least
when they fail to build. Without caretakers interested in those, we may
have to remove them in the end.

If you really can't handle it, please say so, so we can tale appropriate
action.

Thanks! ;-)

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 36c25c9e87..bc7a408425 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1371,7 +1371,10 @@ F:	package/mongrel2/
>  
>  N:	Lothar Felten <lothar.felten@gmail.com>
>  F:	board/bananapi/bananapi-m2-ultra/
> +F:	board/beaglebone/
>  F:	configs/bananapi_m2_ultra_defconfig
> +F:	configs/beaglebone_defconfig
> +F:	configs/beaglebone_qt5_defconfig
>  F:	package/ti-sgx-demos/
>  F:	package/ti-sgx-km/
>  F:	package/ti-sgx-um/
> -- 
> 2.21.0
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

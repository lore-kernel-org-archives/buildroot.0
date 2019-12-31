From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 31 Dec 2019 16:18:44 +0100
Subject: [Buildroot] [PATCH] DEVELOPERS: add Joao Pinto as contact for
 snps_aarch64_vdk_defconfig
In-Reply-To: <20190811120739.26539-7-thomas.petazzoni@bootlin.com>
References: <20190811120739.26539-7-thomas.petazzoni@bootlin.com>
Message-ID: <20191231151844.GG26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2019-08-11 14:07 +0200, Thomas Petazzoni spake thusly:
> Joao added this defconfig a while ago, and is still active
> contributing to Buildroot, so let's add him as the contact for this
> defconfig, so that he receives build failure notifications and gets
> Cc'ed on patches.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Joao Pinto <jpinto@synopsys.com>

Applied to master, thanks.

> ---
> Joao, could you reply with an Acked-by, if you're fine with this?
> Thanks!

Joao, we really need people to take care of the defconfigs, at least
when they fail to build. Without caretakers interested in those, we may
have to remove them in the end.

If you really can't handle it, please say so, so we can take appropriate
action.

Thanks! ;-)

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 62eeb1fa99..8b1ba6b643 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1161,6 +1161,10 @@ F:	package/wmctrl/
>  F:	package/x11r7/xdriver_xf86-video-imx/
>  F:	package/x11r7/xdriver_xf86-video-imx-viv/
>  
> +N:	Joao Pinto <jpinto@synopsys.com>
> +F:	board/synopsys/vdk/
> +F:	configs/snps_aarch64_vdk_defconfig
> +
>  N:	Joel Carlson <JoelsonCarl@gmail.com>
>  F:	package/c-capnproto/
>  F:	package/capnproto/
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

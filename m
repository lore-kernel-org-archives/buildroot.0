From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 31 Dec 2019 16:20:05 +0100
Subject: [Buildroot] [PATCH] DEVELOPERS: add Nicholas Sielicki as
 contact for galileo_defconfig
In-Reply-To: <20190811120739.26539-13-thomas.petazzoni@bootlin.com>
References: <20190811120739.26539-13-thomas.petazzoni@bootlin.com>
Message-ID: <20191231152005.GH26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2019-08-11 14:07 +0200, Thomas Petazzoni spake thusly:
> Nicholas was the most recent person to make significant changes to the
> galileo_defconfig, so let's add him as a contact for this defconfig,
> so that he receives notification of build failures and gets Cc'ed on
> patches.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Nicholas Sielicki <sielicki@yandex.com>
> Cc: Ray Kinsella <ray.kinsella@intel.com>
> Cc: Padraig James Connolly <padraig.connolly@intel.com>

Applied to master, thanks.

> ---
> Nicholas, could you reply with an Acked-by if you're fine with this?
> Thanks!
> 
> Otherwise, Ray and Padraig, if you are still working at Intel and
> willing to maintain this defconfig, please let us know. Thanks!

Nicholas, Ray, Padraig, we really need people to take care of the
defconfigs, at least when they fail to build. Without caretakers
interested in those, we may have to remove them in the end.

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
> index 4cfb67e3a7..a9ed4d5360 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1707,6 +1707,10 @@ N:	Naumann Andreas <ANaumann@ultratronik.de>
>  F:	package/evemu/
>  F:	package/libevdev/
>  
> +N:	Nicholas Sielicki <sielicki@yandex.com>
> +F:	board/intel/galileo/
> +F:	configs/galileo_defconfig
> +
>  N:	Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
>  F:	package/libgit2/
>  
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

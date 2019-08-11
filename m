From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 11 Aug 2019 15:45:21 +0200
Subject: [Buildroot] [PATCH] DEVELOPERS: add Yann E. Morin as contact
 for nanopi_neo_defconfig
In-Reply-To: <20190811120739.26539-12-thomas.petazzoni@bootlin.com>
References: <20190811120739.26539-12-thomas.petazzoni@bootlin.com>
Message-ID: <20190811134521.GA29186@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-08-11 14:07 +0200, Thomas Petazzoni spake thusly:
> Yann originally contributed this defconfig, and updated it regularly
> afterwards, so let's list him as contact for this defconfig.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
> Yann, could you reply with an Acked-by, if you're fine with this?
> Thanks!

TBH, your patch even had me wondering where mines were lying around... I
was able to excavate one out of the junkyard. I am still unsure I can
make it boot again.

But it is indeed lagging behind in terms of kernel and uboot versions,
so I can try and rescucitate it.

Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 8fbb8abad3..4cfb67e3a7 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2382,6 +2382,8 @@ N:	Wojciech Nizi?ski <niziak@spox.org>
>  F:	package/fwup/
>  
>  N:	Yann E. MORIN <yann.morin.1998@free.fr>
> +F:	board/friendlyarm/nanopi-neo/
> +F:	configs/nanopi_neo_defconfig
>  F:	fs/squashfs/
>  F:	package/asterisk/
>  F:	package/cegui06/
> -- 
> 2.21.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

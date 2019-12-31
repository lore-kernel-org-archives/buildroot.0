From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 31 Dec 2019 16:23:09 +0100
Subject: [Buildroot] [PATCH] DEVELOPERS: add Theo Debrouwere as contact
 for beagleboardx15_defconfig
In-Reply-To: <20190811120739.26539-16-thomas.petazzoni@bootlin.com>
References: <20190811120739.26539-16-thomas.petazzoni@bootlin.com>
Message-ID: <20191231152309.GJ26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-08-11 14:07 +0200, Thomas Petazzoni spake thusly:
> Theo added this defconfig in 2016, and is listed as the contact for
> the pugixml package, so it probably makes sense to have him listed as
> a contact for the beagleboardx15_defconfig as well.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Theo Debrouwere <t.debrouwere@televic.com>

Applied to master, thanks.

> ---
> Theo, could you reply with your Acked-by if you're fine with this?
> Thanks!

Theo, we really need people to take care of the defconfigs, at least
when they fail to build. Without caretakers interested in those, we may
have to remove them in the end.

If you really can't handle it, please say so, so we can tale appropriate
action.

Thanks! ;-)

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 35e8d871bc..36c25c9e87 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2227,6 +2227,8 @@ N:	Sven Oliver Moll <svolli@svolli.de>
>  F:	package/most/
>  
>  N:	Theo Debrouwere <t.debrouwere@televic.com>
> +F:	board/beagleboardx15/
> +F:	configs/beagleboardx15_defconfig
>  F:	package/pugixml/
>  
>  N:	Thierry Bultel <tbultel@free.fr>
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

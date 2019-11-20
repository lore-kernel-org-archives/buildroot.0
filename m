From: Jerry Huang <jerry.huang@nxp.com>
Date: Wed, 20 Nov 2019 08:04:54 +0000
Subject: [Buildroot] [EXT] Re: [PATCH 1/9] package/rcw: upgrade the rcw
 version to LSDK-19.09
In-Reply-To: <20191120085944.78aed103@windsurf.home>
References: <20191120040725.32207-1-jerry.huang@nxp.com>
 <20191120040725.32207-2-jerry.huang@nxp.com>
 <20191120085944.78aed103@windsurf.home>
Message-ID: <VI1PR04MB51361145E82DCEF44546E7B5FE4F0@VI1PR04MB5136.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for your reply, Thomas.
I will add-back the hash of license file in next version.

Best Regards
Jerry Huang

-----Original Message-----
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com> 
Sent: Wednesday, November 20, 2019 4:00 PM
To: Jerry Huang <jerry.huang@nxp.com>
Cc: buildroot at busybox.net
Subject: [EXT] Re: [Buildroot] [PATCH 1/9] package/rcw: upgrade the rcw version to LSDK-19.09

Caution: EXT Email

Hello Jerry,

First of all, thanks a lot for this patch series, it is very nice to see NXP directly contributing to Buildroot some support for the LS1028 platform. See below one question about this patch.

On Wed, 20 Nov 2019 12:07:17 +0800
Changming Huang <jerry.huang@nxp.com> wrote:

> Change the RCW version to LSDK-19.09.
>
> Signed-off-by: Changming Huang <jerry.huang@nxp.com>
> ---
>  package/rcw/rcw.hash | 3 +--
>  package/rcw/rcw.mk   | 2 +-
>  2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/package/rcw/rcw.hash b/package/rcw/rcw.hash index 
> 7de1ec659a..3fbb5d167f 100644
> --- a/package/rcw/rcw.hash
> +++ b/package/rcw/rcw.hash
> @@ -1,3 +1,2 @@
>  # Locally calculated
> -sha256 
> 1421ada9fec10b12ff21cd9ad82f0a835b191cb2dde80f03547764574b1346c3 
> rcw-LSDK-18.12.tar.gz
> -sha256 
> a531b3146425e592db17a51ff39c4801cb01fb4055ffdaada0572decc0655bcd 
> LICENSE

Why are you removing the hash of the license file here ?

Best regards,

Thomas
--
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbootlin.com&amp;data=02%7C01%7Cjerry.huang%40nxp.com%7C386c6a3dbcc941510fa508d76d8f9be5%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637098335879692477&amp;sdata=i4kLTZ4FkszCKJEZ7sBpbJ4h%2BcsrrFe5HbjJzB3jz1I%3D&amp;reserved=0

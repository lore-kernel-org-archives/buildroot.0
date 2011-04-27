From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 27 Apr 2011 15:50:34 +0300
Subject: [Buildroot] [PATCH v2] libnl: bump to version 2.0
In-Reply-To: <4DB81033.1040503@visionsystems.de>
References: <4DB81033.1040503@visionsystems.de>
Message-ID: <20110427125034.GA12092@jasper.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yegor,

On Wed, Apr 27, 2011 at 02:46:43PM +0200, Yegor Yefremov wrote:
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> 
> 
> Index: b/package/libnl/libnl.mk
> ===================================================================
> --- a/package/libnl/libnl.mk	2011-04-26 02:04:14.206276675 -0700
> +++ b/package/libnl/libnl.mk	2011-04-27 05:43:47.382292483 -0700
> @@ -4,9 +4,9 @@
>  #
>  #############################################################
>  
> -LIBNL_VERSION = 1.1
> +LIBNL_VERSION = 3.0

You should probably change ${SUBJECT}.

By the way, since there are API changes between those libnl versions, does 
this change affect other packages using libnl?

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

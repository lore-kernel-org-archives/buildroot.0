From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 28 Jul 2013 09:26:15 +0300
Subject: [Buildroot] [PATCH] ser2net: bump to 2.9
In-Reply-To: <1374992536-7801-1-git-send-email-yegorslists@googlemail.com>
References: <1374992536-7801-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20130728062615.GG5161@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yegor,

On Sun, Jul 28, 2013 at 08:22:16AM +0200, Yegor Yefremov wrote:
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/ser2net/ser2net.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
> index 588571c..cc728a6 100644
> --- a/package/ser2net/ser2net.mk
> +++ b/package/ser2net/ser2net.mk
> @@ -4,8 +4,9 @@
>  #
>  ################################################################################
>  
> -SER2NET_VERSION = 2.8
> +SER2NET_VERSION = 2.9
>  SER2NET_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
> +SER2NET_AUTORECONF = YES

Please add a comment explaining why this is needed.

baruch

>  SER2NET_LICENSE = GPLv2+
>  SER2NET_LICENSE_FILES = COPYING

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

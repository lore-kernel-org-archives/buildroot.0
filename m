From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 30 Dec 2014 07:16:06 +0200
Subject: [Buildroot] [PATCH 1/2] lcms2: Install into staging
In-Reply-To: <1419905244-7418-1-git-send-email-nerv@dawncrow.de>
References: <1419905244-7418-1-git-send-email-nerv@dawncrow.de>
Message-ID: <20141230051606.GD16594@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Andr?,

On Tue, Dec 30, 2014 at 03:07:23AM +0100, Andr? Hentschel wrote:
> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> ---
>  package/lcms2/lcms2.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
> index 5d22041..c2eda98 100644
> --- a/package/lcms2/lcms2.mk
> +++ b/package/lcms2/lcms2.mk
> @@ -6,6 +6,7 @@
>  
>  LCMS2_VERSION = 2.5
>  LCMS2_SITE = http://downloads.sourceforge.net/lcms/lcms
> +LCMS2_INSTALL_STAGING = YES

Please explain in the commit log why you need this. The same goes for the next 
patch in this series (sane-backends).

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

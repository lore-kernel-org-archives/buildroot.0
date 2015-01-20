From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 20 Jan 2015 12:51:32 +0200
Subject: [Buildroot] [PATCH] iperf: add license information
In-Reply-To: <1421748906-417-1-git-send-email-richard.genoud@gmail.com>
References: <1421748906-417-1-git-send-email-richard.genoud@gmail.com>
Message-ID: <20150120105132.GD2146@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Richard,

On Tue, Jan 20, 2015 at 11:15:06AM +0100, Richard Genoud wrote:
> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
> ---
>  package/iperf/iperf.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/iperf/iperf.mk b/package/iperf/iperf.mk
> index 2947e5241974..4ec56e0f2c23 100644
> --- a/package/iperf/iperf.mk
> +++ b/package/iperf/iperf.mk
> @@ -6,6 +6,7 @@
>  
>  IPERF_VERSION = 2.0.5
>  IPERF_SITE = http://downloads.sourceforge.net/project/iperf
> +IPERF_LICENSE_FILES = COPYING

Missing IPERF_LICENSE.

baruch

>  
>  IPERF_CONF_ENV = \
>  	ac_cv_func_malloc_0_nonnull=yes \

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

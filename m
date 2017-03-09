From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Thu, 9 Mar 2017 08:51:13 +0100
Subject: [Buildroot] [PATCH 1/2] ti-uim: moved to github
In-Reply-To: <af8528c725dbee3b80a8a99b2adba50a6ff4114d.1489038337.git.baruch@tkos.co.il>
References: <af8528c725dbee3b80a8a99b2adba50a6ff4114d.1489038337.git.baruch@tkos.co.il>
Message-ID: <20170309075113.trxvep3ieaukmntv@piout.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/03/2017 at 07:45:36 +0200, Baruch Siach wrote:
> gitorious.org is down. Use the github repo instead.
> 

Weird, I thought a patch had already been sent to do that.

> Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>


> ---
>  package/ti-uim/ti-uim.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/ti-uim/ti-uim.mk b/package/ti-uim/ti-uim.mk
> index b49818004989..1c78db0e6f01 100644
> --- a/package/ti-uim/ti-uim.mk
> +++ b/package/ti-uim/ti-uim.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  TI_UIM_VERSION = c73894456df5def97111cb33d2106b684b8b7959
> -TI_UIM_SITE = git://gitorious.org/uim/uim.git
> +TI_UIM_SITE = $(call github,96boards,uim,$(TI_UIM_VERSION))
>  TI_UIM_LICENSE = GPLv2+
>  
>  define TI_UIM_BUILD_CMDS
> -- 
> 2.11.0
> 

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

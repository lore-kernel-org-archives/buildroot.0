From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Mon, 13 Mar 2017 18:00:07 +0100
Subject: [Buildroot] [PATCH] ti-uim: add license file
In-Reply-To: <1d2068673affad621671022ec3924a495d4a72b5.1489416133.git.baruch@tkos.co.il>
References: <1d2068673affad621671022ec3924a495d4a72b5.1489416133.git.baruch@tkos.co.il>
Message-ID: <20170313170007.rduotdnogt6b22hf@piout.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/03/2017 at 16:42:13 +0200, Baruch Siach wrote:
> In the absence of full license text file, take a short source file that
> mentions the license in its comment header.
> 
> Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Seems good to me.
Acked-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>

As it seems you are really using it while I haven't in a while, I
suggest you add uim to your DEVELOPERS entry.

> ---
>  package/ti-uim/ti-uim.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/ti-uim/ti-uim.mk b/package/ti-uim/ti-uim.mk
> index a6e19b87ca9a..66b93e443091 100644
> --- a/package/ti-uim/ti-uim.mk
> +++ b/package/ti-uim/ti-uim.mk
> @@ -7,6 +7,7 @@
>  TI_UIM_VERSION = a0236bc252e6484835ce266ae4a50b361f6a902d
>  TI_UIM_SITE = $(call github,96boards,uim,$(TI_UIM_VERSION))
>  TI_UIM_LICENSE = GPLv2+
> +TI_UIM_LICENSE_FILES = uim.h
>  
>  define TI_UIM_BUILD_CMDS
>  	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
> -- 
> 2.11.0
> 

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

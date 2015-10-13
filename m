From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Oct 2015 23:30:37 +0200
Subject: [Buildroot] [PATCH 7/7] configs: remove old/broken Atmel
 configurations
In-Reply-To: <1443901457-7914-8-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1443901457-7914-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1443901457-7914-8-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20151013233037.15947691@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  3 Oct 2015 20:44:17 +0100, Thomas Petazzoni wrote:
> The at91rm9200df_defconfig configuration is really old: it builds a
> 2.6.38 kernel with the old days kernel patches and a 2010.06
> U-Boot. It hasn't been updated since a long time, so let's get rid of
> it.
> 
> The at91sam9260dfc_defconfig, at91sam9261ek_defconfig and
> at91sam9263ek_defconfig refer to kernel defconfigs that no longer
> exists, so they fail to build.
> 
> Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  configs/at91rm9200df_defconfig   | 30 ------------------------------
>  configs/at91sam9260dfc_defconfig | 19 -------------------
>  configs/at91sam9261ek_defconfig  | 19 -------------------
>  configs/at91sam9263ek_defconfig  | 19 -------------------
>  4 files changed, 87 deletions(-)
>  delete mode 100644 configs/at91rm9200df_defconfig
>  delete mode 100644 configs/at91sam9260dfc_defconfig
>  delete mode 100644 configs/at91sam9261ek_defconfig
>  delete mode 100644 configs/at91sam9263ek_defconfig

I've applied this patch. Alex, when you have some time, don't hesitate
to resubmit new defconfig for those boards.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

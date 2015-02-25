From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 25 Feb 2015 08:07:55 +0200
Subject: [Buildroot] [PATCH] toolchain-external: add Synopsys DesignWare
 tools for ARC cores
In-Reply-To: <1424789229-2613-1-git-send-email-abrodkin@synopsys.com>
References: <1424789229-2613-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20150225060755.GI2376@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexey,

On Tue, Feb 24, 2015 at 05:47:09PM +0300, Alexey Brodkin wrote:
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index 5a69eb8..0d380e1 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -21,6 +21,7 @@
>  #    default glibc-based variant is.
>  #  * Analog Devices toolchains for the Blackfin architecture
>  #  * Xilinx toolchains for the Microblaze architecture
> +#  * Synopsys DesignWare tolchains for ARC cores

toolchains

baruch


-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Mar 2016 18:41:03 +0200
Subject: [Buildroot] [PATCH] configs: rename Zynq defconfig files
In-Reply-To: <1456972732-9033-1-git-send-email-yamada.masahiro@socionext.com>
References: <1456972732-9033-1-git-send-email-yamada.masahiro@socionext.com>
Message-ID: <20160331184103.70f784bb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  3 Mar 2016 11:38:52 +0900, Masahiro Yamada wrote:
> These three are Zynq boards and the build procedure is almost the
> same.  Having the SoC name prefix "zynq_" would be more consistent.
> Also, this is the way in which the Linux Device Trees and the U-Boot
> configuration files do.
> 
> This commit renames as follows:
> 
>    zedboard_defconfig     -> zynq_zed_defconfig
>    microzed_defconfig     -> zynq_microzed_defconfig
>    xilinx_zc706_defconfig -> zynq_zc706_defconfig
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

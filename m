From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jul 2016 14:58:12 +0200
Subject: [Buildroot] [PATCH] configs: atmel: fix typo in sama5d4
 xplained development defconfig
In-Reply-To: <20160722131854.19494-1-ludovic.desroches@atmel.com>
References: <20160722131854.19494-1-ludovic.desroches@atmel.com>
Message-ID: <20160723145812.04ab936d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 22 Jul 2016 15:18:54 +0200, Ludovic Desroches wrote:
> The defconfig file for at91bootstrap was false:
> s/sama5d4_xplainedsnf_uboot_secure/sama5d4_xplainednf_uboot_secure.
> 
> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> ---
>  configs/atmel_sama5d4_xplained_dev_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

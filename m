From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Apr 2016 21:21:54 +0200
Subject: [Buildroot] [PATCH] configs: atmel: sama5d2 has vfpv4-d16
In-Reply-To: <1461079449-24605-1-git-send-email-ludovic.desroches@atmel.com>
References: <1461079449-24605-1-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <20160419212154.70337db4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 19 Apr 2016 17:24:09 +0200, Ludovic Desroches wrote:
> The datasheet indicates vfpv4 but it stands for vfpv4-d16 not vfpv4-32.
> 
> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> ---
>  configs/atmel_sama5d2_xplained_mmc_defconfig | 1 -
>  1 file changed, 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

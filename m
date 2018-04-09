From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Apr 2018 21:23:37 +0200
Subject: [Buildroot] [PATCH 1/2] zynq_zed: linux: bump to latest
 mainline kernel
In-Reply-To: <1523285228-17851-1-git-send-email-luca@lucaceresoli.net>
References: <1523285228-17851-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20180409212337.7b6dea9d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  9 Apr 2018 16:47:07 +0200, Luca Ceresoli wrote:
> The Zynq SoCs are now well supported in the mainline kernel, thus stop
> using the Xilinx fork.
> 
> As there is not xilinx_zynq defconfig in mainline, use the default
> arch config.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> 
> --
> 
> Note: this requires the kernel 4.16 bump patchset by Bernd:
>       https://patchwork.ozlabs.org/project/buildroot/list/?series=37904
> ---
>  configs/zynq_zed_defconfig | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks. Minor nit on this first patch, I would have
preferred the commit title to start with "configs/zynq_zed" rather than
just "zynq_zed". Yes that's a minor nit :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

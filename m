From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Mar 2019 23:20:10 +0100
Subject: [Buildroot] [PATCH 1/1] board/freescale/common/imx: fix
 imx8-bootloader-prepare for i.MX8M
In-Reply-To: <20190306214721.8996-1-juju@cotds.org>
References: <20190306214721.8996-1-juju@cotds.org>
Message-ID: <20190307232010.13118304@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  6 Mar 2019 22:47:21 +0100
Julien Olivain <juju@cotds.org> wrote:

> The update of imx-mkimage in commit
> c14d92d439062caa6c94c4a93b20ab18aa20554c
> 
> broke the imx8-bootloader-prepare.sh script for i.MX8M, used in
> freescale_imx8mqevk_defconfig
> 
> The updated mkimage_fit_atf.sh script in imx-mkimage now needs
> a ATF_LOAD_ADDR variable, which was set to 0x00910000 for i.MX8M.
> 
> Signed-off-by: Julien Olivain <juju@cotds.org>
> ---
>  board/freescale/common/imx/imx8-bootloader-prepare.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

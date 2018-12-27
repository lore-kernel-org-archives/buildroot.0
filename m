From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Dec 2018 10:02:22 +0100
Subject: [Buildroot] [PATCH 1/9] board/freescale/imx8mqevk: Fix typos in
 readme
In-Reply-To: <20181226223112.24456-1-nerv@dawncrow.de>
References: <20181226223112.24456-1-nerv@dawncrow.de>
Message-ID: <20181227100222.4a116b33@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 26 Dec 2018 23:31:04 +0100, Andr? Hentschel wrote:
> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> ---
>  board/freescale/imx8mqevk/readme.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/board/freescale/imx8mqevk/readme.txt b/board/freescale/imx8mqevk/readme.txt
> index a32c122f91..26b5ab74d0 100644
> --- a/board/freescale/imx8mqevk/readme.txt
> +++ b/board/freescale/imx8mqevk/readme.txt
> @@ -21,7 +21,7 @@ You will find in output/images/ the following files:
>    - boot.vfat
>    - fsl-imx8mq-evk.dtb
>    - Image
> -  - imx-boot-imx8mqevk-sd.bin
> +  - imx-boot-sd.bin

Isn't the actual file name imx8-boot-sd.bin ?

At least this is what
board/freescale/common/imx/imx8-bootloader-prepare.sh is producing, and
what board/freescale/common/imx/genimage.cfg.template_imx8 is using as
input.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

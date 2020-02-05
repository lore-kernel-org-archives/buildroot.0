From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Feb 2020 11:30:06 +0100
Subject: [Buildroot] [PATCH 1/7] board/freescale/common/imx: add support
 for i.MX8QM
In-Reply-To: <20190909121525.13935-1-maeva.manuel@nxp.com>
References: <20190909121525.13935-1-maeva.manuel@nxp.com>
Message-ID: <20200205113006.0930239e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 9 Sep 2019 12:14:55 +0000
Maeva Manuel <maeva.manuel@nxp.com> wrote:

> Signed-off-by: Maeva Manuel <maeva.manuel@nxp.com>
> ---
>  board/freescale/common/imx/imx8-bootloader-prepare.sh | 7 +++++--
>  board/freescale/common/imx/post-image.sh              | 4 +++-
>  2 files changed, 8 insertions(+), 3 deletions(-)

Thanks, I have applied, but at a later point in the series, i.e after
the imx-firmware-sc change that ensures the proper firmware gets
installed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

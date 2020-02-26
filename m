From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Feb 2020 22:28:46 +0100
Subject: [Buildroot] [PATCH 1/2] board/freescale: use correct
 ahab-container.img file name
In-Reply-To: <20200220021858.700249-1-thomas.petazzoni@bootlin.com>
References: <20200220021858.700249-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200226222846.4982fb09@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 20 Feb 2020 03:18:56 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Commit 3f8ace002831a01ed6aec59b704bd92c8a3b957f
> ("board/freescale/common/imx: add support for i.MX8") had its
> conflicts incorrectly tweaked when applied to Buildroot. The
> ahab-container.img is installed with this name (ahab-container.img) by
> the imx-firmware package, and not mx8qm-ahab-container.img or
> mx8qx-ahab-container.img.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  board/freescale/common/imx/imx8-bootloader-prepare.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 20 Feb 2020 17:33:14 -0300
Subject: [Buildroot] [PATCH 1/2] board/freescale: use correct
 ahab-container.img file name
In-Reply-To: <20200220021858.700249-1-thomas.petazzoni@bootlin.com>
References: <20200220021858.700249-1-thomas.petazzoni@bootlin.com>
Message-ID: <CAOMZO5AgM7Zp-SBvy6MCegi+b4NzJBc3QiiwOhPpLCUeKh4BiQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Feb 19, 2020 at 11:19 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Commit 3f8ace002831a01ed6aec59b704bd92c8a3b957f
> ("board/freescale/common/imx: add support for i.MX8") had its
> conflicts incorrectly tweaked when applied to Buildroot. The
> ahab-container.img is installed with this name (ahab-container.img) by
> the imx-firmware package, and not mx8qm-ahab-container.img or
> mx8qx-ahab-container.img.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Reported-by: Fabio Estevam <festevam@gmail.com>
Tested-by: Fabio Estevam <festevam@gmail.com>

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 27 Feb 2019 18:21:23 +0100
Subject: [Buildroot] [PATCH 1/1] imx-mkimage: Add patch to satisfy
 unused version generation
In-Reply-To: <20190225212359.19095-1-nerv@dawncrow.de>
References: <20190225212359.19095-1-nerv@dawncrow.de>
Message-ID: <20190227182123.706da2b1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andr?,

On Mon, 25 Feb 2019 22:23:59 +0100
Andr? Hentschel <nerv@dawncrow.de> wrote:

> Fixes:
> 
> http://autobuild.buildroot.net/results/1973d39b113c37e65c35f1f0a56354f192ae02d7
> 
> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> ---
>  .../0003-Add-unused-fake-version.patch        | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/imx-mkimage/0003-Add-unused-fake-version.patch

Applied to next, thanks. I assumed this patch was for next, as the
build failure is on next, and I suppose is related to the recent bump
of imx-mkimage.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

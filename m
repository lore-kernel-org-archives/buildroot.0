From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Apr 2021 21:53:42 +0200
Subject: [Buildroot] [PATCH]
 package/freescale-imx/kernel-module-imx-gpu-viv: bump to version 6.4.3.p1.2
In-Reply-To: <20210426144824.1412614-1-gary.bisson@boundarydevices.com>
References: <20210426144824.1412614-1-gary.bisson@boundarydevices.com>
Message-ID: <20210426215342.162c235d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 26 Apr 2021 16:48:24 +0200
Gary Bisson <gary.bisson@boundarydevices.com> wrote:

> - Same version as NXP release 5.10.9-1.0.0
> - No changelog provided by NXP
> - Tested on Nitrogen8M device with Weston (DRM backend) as follows:
>  # cd /usr/share/examples/viv_samples/vdk/
>  # ./tutorial7
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
> Needed in order to match the new version of the imx-gpu-viv libraries
> that have been pused recently [1].

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

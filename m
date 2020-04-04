From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 4 Apr 2020 22:57:23 +0200
Subject: [Buildroot] [PATCH 1/2] kernel-module-imx-gpu-viv: bump to
 version 6.4.0.p1.0
In-Reply-To: <20200402130842.918696-2-gary.bisson@boundarydevices.com>
References: <20200402130842.918696-1-gary.bisson@boundarydevices.com>
 <20200402130842.918696-2-gary.bisson@boundarydevices.com>
Message-ID: <20200404225723.25b1ad66@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  2 Apr 2020 15:08:41 +0200
Gary Bisson <gary.bisson@boundarydevices.com> wrote:

> This package has been tested on Nitrogen8M with the following commands:
>  # modprobe galcore
>  # cd /usr/share/examples/viv_samples/vdk/
>  # ./tutorial7
> 
> Also update the help text as we shouldn't specify a kernel revision. It
> is just that this module isn't meant for mainline kernel, only its NXP
> forked version.
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
>  package/freescale-imx/kernel-module-imx-gpu-viv/Config.in       | 2 +-
>  .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash    | 2 +-
>  .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk      | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

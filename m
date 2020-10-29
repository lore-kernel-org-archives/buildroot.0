From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Oct 2020 23:34:43 +0100
Subject: [Buildroot] [PATCH] package/freescale-imx/imx-gpu-viv: remove
 fb headers fixup
In-Reply-To: <20201027171245.1823252-1-gary.bisson@boundarydevices.com>
References: <20201027171245.1823252-1-gary.bisson@boundarydevices.com>
Message-ID: <20201029233443.229a96ee@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 27 Oct 2020 18:12:45 +0100
Gary Bisson <gary.bisson@boundarydevices.com> wrote:

> As it doesn't seem to be needed any longer. Also it was agreed to fix
> packages not using pkgconfig properly instead of doing this sed.
> 
> Tested on i.MX6 platform with Qt5, no more issues.
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
>  package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk | 10 ----------
>  1 file changed, 10 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

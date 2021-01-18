From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jan 2021 22:15:27 +0100
Subject: [Buildroot] [PATCH] Config.in.legacy: fix selection of
 firmware-imx
In-Reply-To: <20210118203212.5213-1-romain.naour@gmail.com>
References: <20210118203212.5213-1-romain.naour@gmail.com>
Message-ID: <20210118221527.1d2d0336@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 18 Jan 2021 21:32:12 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> In order to select firmware-imx we have to select freescale-imx first.
> 
> Reported-by: Gary Bisson <gary.bisson@boundarydevices.com>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  Config.in.legacy | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 15 Sep 2020 15:19:02 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/freescale-imx/firmware-imx:
 custom padding
In-Reply-To: <20200915130414.3286332-1-pieter.degendt@basalte.be>
References: <20200910141843.3030855-1-pieter.degendt@basalte.be>
 <20200915130414.3286332-1-pieter.degendt@basalte.be>
Message-ID: <20200915131902.GA316402@p1g2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Pieter,

On Tue, Sep 15, 2020 at 03:04:14PM +0200, Pieter De Gendt wrote:
> From: Tibault Damman <tibault.damman@basalte.be>
> 
> Some derivatives (such as Variscite imx8mm) expect the (LP)DDR4
> training data to be padded to a different length.
> 
> eg: https://github.com/varigit/uboot-imx/commit/5f8d814f
> 
> This patch makes the padding length configurable.
> 
> Signed-off-by: Tibault Damman <tibault.damman@basalte.be>
> Signed-off-by: Pieter De Gendt <pieter.degendt@basalte.be>
> 
> ---
> Changes v1 -> v2:
>   - improved description
>   - renamed variables to match U-Boot (suggested by Gary Bisson)
> 
> Signed-off-by: Pieter De Gendt <pieter.degendt@basalte.be>

Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>

Thanks for your contribution!

Regards,
Gary

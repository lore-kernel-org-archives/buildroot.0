From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Feb 2019 16:34:24 +0100
Subject: [Buildroot] [PATCH/next v3 1/6] package/freescale-imx: Add
 support for i.MX8X
In-Reply-To: <20190218204807.16815-2-nerv@dawncrow.de>
References: <20190218204807.16815-1-nerv@dawncrow.de>
 <20190218204807.16815-2-nerv@dawncrow.de>
Message-ID: <20190223163424.37623476@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Feb 2019 21:48:02 +0100
Andr? Hentschel <nerv@dawncrow.de> wrote:

> From: Andr? Hentschel <andre.hentschel@zf.com>
> 
> Signed-off-by: Andr? Hentschel <andre.hentschel@zf.com>
> ---
>  package/freescale-imx/Config.in                    | 3 +++
>  package/freescale-imx/firmware-imx/firmware-imx.mk | 8 ++++++++
>  2 files changed, 11 insertions(+)

I've applied to next, but after splitting into two commits: a first one
adding the new Config.in option, and another one adding i.MX8X support
to firmware-imx.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

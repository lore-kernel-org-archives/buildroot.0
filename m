From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Feb 2020 11:31:49 +0100
Subject: [Buildroot] [PATCH 2/7] package/freescale-imx: add option for
 i.MX8QM
In-Reply-To: <20190909121525.13935-2-maeva.manuel@nxp.com>
References: <20190909121525.13935-1-maeva.manuel@nxp.com>
 <20190909121525.13935-2-maeva.manuel@nxp.com>
Message-ID: <20200205113149.191a2949@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 9 Sep 2019 12:14:58 +0000
Maeva Manuel <maeva.manuel@nxp.com> wrote:

> Signed-off-by: Maeva Manuel <maeva.manuel@nxp.com>

I have applied after extending the commit log to give a bit more
context about the i.MX8 family, which contains i.MX8QM and i.MX8QP.

I've also updated BR2_PACKAGE_FREESCALE_IMX_PLATFORM and
BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU with this new i.MX platform, as
suggested by Gary.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

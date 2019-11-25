From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Nov 2019 23:13:42 +0100
Subject: [Buildroot] [PATCH v2 08/10]
 package/freescale-qoriq/fsl-qoriq-rcw:Enable IIC5_PMUX and CLK_OUT_PMUX for
 GPIO
In-Reply-To: <20191121102324.35225-9-jerry.huang@nxp.com>
References: <20191121102324.35225-1-jerry.huang@nxp.com>
 <20191121102324.35225-9-jerry.huang@nxp.com>
Message-ID: <20191125231342.714eadfb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 21 Nov 2019 18:23:22 +0800
Changming Huang <jerry.huang@nxp.com> wrote:

> From: Jerry Huang <jerry.huang@nxp.com>
> 
> Because GPIO is used as interrupt for eNETC PHY and Micro-bus,
> IIC5_PMUX and CLK_OUT_PMUX are enabled for GPIO.
> 
> Signed-off-by: Jerry Huang <jerry.huang@nxp.com>

What is the upstream status of those patches? Will NXP merge them in
the rcw project, and will make them available as part of a future RCW
release ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

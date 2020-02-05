From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Feb 2020 13:29:22 +0100
Subject: [Buildroot] [PATCH v4 5/9] boot/arm-trusted-firmware: introduce
 two new options
In-Reply-To: <20200205105227.13698-5-jerry.huang@nxp.com>
References: <20200205105227.13698-1-jerry.huang@nxp.com>
 <20200205105227.13698-5-jerry.huang@nxp.com>
Message-ID: <20200205132922.2bce41ac@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  5 Feb 2020 18:52:23 +0800
Changming Huang <jerry.huang@nxp.com> wrote:

> two new options for arm-trusted-firmware:
> 1. BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS
> 	- for additional targets, E.G. "pbl".

This option was already added in commit
05b8c7da6de863561d66717735a4870f2766454c, which is part of Buildroot
master.

> 2. BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_DEPENDENCIES
> 	- for additional dependencies, E.G. "host-qoriq-rcw"
> 
> Signed-off-by: Changming Huang <jerry.huang@nxp.com>

No need to resend just for that, though, it can be fixed when applying.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

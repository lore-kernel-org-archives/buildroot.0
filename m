From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 26 May 2019 22:40:34 +0200
Subject: [Buildroot] [PATCH V2 1/9] arch/csky: Add VDSP and FLOAT_ABI
 compiler options.
In-Reply-To: <1557305915-11247-1-git-send-email-guoren@kernel.org>
References: <1557305915-11247-1-git-send-email-guoren@kernel.org>
Message-ID: <20190526224034.60d5671e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  8 May 2019 16:58:27 +0800
guoren at kernel.org wrote:

> +config BR2_CSKY_VDSP
> +	bool "Enable VDSP 3.0 enhanced instructions Co-processor"
> +	depends on BR2_ck860

Another comment: you add an option that depends on BR2_ck860 in this
PATCH 1, but BR2_ck860 is only added in PATCH 2. This is not correct.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

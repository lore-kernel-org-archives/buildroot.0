From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 16:52:54 +0200
Subject: [Buildroot] [[PATCH v2 06/14] package/mender: select
 BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV
In-Reply-To: <20180820130914.22377-7-mirza.krak@northern.tech>
References: <20180820130914.22377-1-mirza.krak@northern.tech>
 <20180820130914.22377-7-mirza.krak@northern.tech>
Message-ID: <20180820165254.059d0c83@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Aug 2018 15:09:06 +0200, Mirza Krak wrote:
> The Mender client uses fw_printenv/fw_setenv to manipulate the U-boot
> environment, e.g to change the boot candidate after a update has been
> done.
> 
> Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

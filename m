From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 10:48:56 +0100
Subject: [Buildroot] [PATCHv2-next 1/2] orangepi_pc_defconfig: bump
 linux to 4.19.3, u-boot to 2018.11
In-Reply-To: <20181123075114.8806-1-peter@korsgaard.com>
References: <20181123075114.8806-1-peter@korsgaard.com>
Message-ID: <20181123104856.03690dfe@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 23 Nov 2018 08:51:13 +0100, Peter Korsgaard wrote:
> 4.18 brought cpufreq support for H3, but sunxi_defconfig does not enable the
> driver for the sy8106a regulator used on the board or enable the ondemand
> cpufreq govenor so the frequency is dynamically adjusted - So enable these in
> linux.fragment.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
> Changes since v1:
> - Enable ondemand govenor so CPU frequency is actually dynamically adjusted

Both applied to next.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

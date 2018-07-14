From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Jul 2018 22:03:59 +0200
Subject: [Buildroot] [PATCH] minnowboard_max: add CONFIG_IGB kconfig
In-Reply-To: <20180714191514.3470-1-pierre-louis.bossart@linux.intel.com>
References: <20180714191514.3470-1-pierre-louis.bossart@linux.intel.com>
Message-ID: <20180714220359.5dd5bfea@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 14 Jul 2018 14:15:14 -0500, Pierre-Louis Bossart wrote:
> The 2017 MinnowBoard Turbot skews no longer use the Realtek 8169
> Ethernet chip.  The Turbot D0 uses The Intel I211, the Turbot Dual
> Ethernet has an I210 (quad-core) or I211 (dual-core).
> 
> Add CONFIG_IGB to the Linux config but keep the Realtek 8169 support
> to avoid breaking older boards
> 
> Tested on Turbot D0, lspci -k shows the igb driver is used:
> 03:00.0 Class 0200: 8086:1539 igb
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  board/minnowboard/linux.config | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

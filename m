From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Mar 2018 22:20:15 +0200
Subject: [Buildroot] [PATCH 1/1] rpi-bt-firmware: remove compatibility
 symlink
In-Reply-To: <20180317161117.28469-1-bluemrp9@gmail.com>
References: <20180317161117.28469-1-bluemrp9@gmail.com>
Message-ID: <20180326222015.1615bdc7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 17 Mar 2018 09:11:17 -0700, Ryan Coe wrote:
> Commit 361d1b969ecdba1a8a62613626f90fc025b94660 defines FIRMWARE_DIR for
> bluez5_utils. The compatibility symlink for the firmware is no longer
> needed.
> 
> Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
> ---
>  package/rpi-bt-firmware/rpi-bt-firmware.mk | 3 ---
>  1 file changed, 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

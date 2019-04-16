From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Apr 2019 22:37:02 +0200
Subject: [Buildroot] [PATCH] package/linux-firmware: move
 BR2_PACKAGE_LINUX_FIRMWARE_TI_CC2560 to Bluetooth
In-Reply-To: <20190223010732.9120-1-david@lechnology.com>
References: <20190223010732.9120-1-david@lechnology.com>
Message-ID: <20190416223702.524efe32@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 22 Feb 2019 19:07:32 -0600
David Lechner <david@lechnology.com> wrote:

> This moves the BR2_PACKAGE_LINUX_FIRMWARE_TI_CC2560 option to the
> Bluetooth section of the config file. This chip is Bluetooth-only, so
> it belongs there instead of with the Wi-Fi/Bluetooth combo chips.
> 
> Signed-off-by: David Lechner <david@lechnology.com>
> ---
>  package/linux-firmware/Config.in | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

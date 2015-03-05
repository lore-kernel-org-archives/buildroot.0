From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Mar 2015 12:30:54 +0100
Subject: [Buildroot] [PATCH 1/1] configs: update config for Atmel
 SAMA5D3 Xplained board
In-Reply-To: <1425526590-5961-1-git-send-email-ryanbarnett3@gmail.com>
References: <1425526590-5961-1-git-send-email-ryanbarnett3@gmail.com>
Message-ID: <20150305123054.3e454df6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Barnett,

On Wed,  4 Mar 2015 21:36:30 -0600, Ryan Barnett wrote:
> Update configuration to use the 3.18.8 kernel and update U-Boot to
> 2015.01. With the switch to 2015.01. use the U-Boot SPL image for the
> first stage bootloader instead of the at91bootstrap. The U-Boot SPL
> requires that the U-Boot image format be u-boot.img in order to load
> from the SD card.
> 
> Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
> ---
>  board/atmel/xplained/readme.txt  |  4 ++--
>  configs/atmel_xplained_defconfig | 16 +++++++---------
>  2 files changed, 9 insertions(+), 11 deletions(-)

I've tested this on HW, and applied, thanks!

Now that there is a sama5d4 Xplained board, maybe we should rename this
defconfig, and the board directory to sama5d3-xplained or something
like that.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

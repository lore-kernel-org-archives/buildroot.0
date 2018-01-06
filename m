From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Jan 2018 15:18:13 +0100
Subject: [Buildroot] [PATCH] linux-firmware: update Broadcom 43xxx file
 list
In-Reply-To: <20180104132020.13429-1-joerg.krause@embedded.rocks>
References: <20180104132020.13429-1-joerg.krause@embedded.rocks>
Message-ID: <20180106151813.5e6e523d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  4 Jan 2018 14:20:20 +0100, J?rg Krause wrote:
> Add firmware file 'brcmfmac43430a0-sdio.bin' for bcm43430 revision 0.
> Fix alphatical order for entry 'brcmfmac43430-sdio.bin'.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/linux-firmware/linux-firmware.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Apr 2018 21:26:40 +0200
Subject: [Buildroot] [PATCH] Added Qualcomm video accelerator and GPU
 firmware option.
In-Reply-To: <20180411213938.5888-1-andre@ignavus.net>
References: <20180411213938.5888-1-andre@ignavus.net>
Message-ID: <20180412212640.6402f6a0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 Apr 2018 09:39:38 +1200, Andre Renaud wrote:
> From: Andre Renaud <arenaud@designa-electronics.com>
> 
> Signed-off-by: Andre Renaud <andre@ignavus.net>
> ---
>  package/linux-firmware/Config.in           | 10 ++++++++++
>  package/linux-firmware/linux-firmware.hash |  1 +
>  package/linux-firmware/linux-firmware.mk   | 10 ++++++++++
>  3 files changed, 21 insertions(+)

Applied to master after fixing the commit title. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Jun 2019 21:41:00 +0200
Subject: [Buildroot] [PATCH 1/1] linux-firmware: add options to install
 more Mediatek firmwares.
In-Reply-To: <20190104154951.21807-1-nicolas.cavallari@green-communications.fr>
References: <20190104154951.21807-1-nicolas.cavallari@green-communications.fr>
Message-ID: <20190623214100.33755e11@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  4 Jan 2019 16:49:51 +0100
Nicolas Cavallari <nicolas.cavallari@green-communications.fr> wrote:

> Add option to install the MT7650 bluetooth firmware and the
> MT76x2e wifi firmware.
> 
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> ---
>  package/linux-firmware/Config.in         | 10 ++++++++++
>  package/linux-firmware/linux-firmware.mk | 12 ++++++++++++
>  2 files changed, 22 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

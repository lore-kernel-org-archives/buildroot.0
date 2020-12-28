From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 Dec 2020 22:31:53 +0100
Subject: [Buildroot] [PATCH v2] package/linux-firmware: add new option
 for USB TI 3410/5052 firmwares
In-Reply-To: <959f9888c87ef2034082624c15158f795ae72a96.1609166898.git.stefan@agner.ch>
References: <959f9888c87ef2034082624c15158f795ae72a96.1609166898.git.stefan@agner.ch>
Message-ID: <20201228223153.06e9bf1e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 28 Dec 2020 15:48:44 +0100
Stefan Agner <stefan@agner.ch> wrote:

> This adds generic firmware for USB TI 3410/5052 devices and a couple of
> device specific firmwares.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  package/linux-firmware/Config.in         |  9 +++++++++
>  package/linux-firmware/linux-firmware.mk | 10 ++++++++++
>  2 files changed, 19 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

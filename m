From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Nov 2016 16:36:00 +0100
Subject: [Buildroot] [PATCH next] olimex_imx233_olinuxino: restore Wifi
 config
In-Reply-To: <1478859580-6214-1-git-send-email-francois.perrad@gadz.org>
References: <1478859580-6214-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20161111163600.1a91efe7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 11 Nov 2016 11:19:40 +0100, Francois Perrad wrote:
> add a fragment with configs from retired linux-3.18.config
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  board/olimex/imx233_olinuxino/linux-wifi.fragment | 18 ++++++++++++++++++
>  configs/olimex_imx233_olinuxino_defconfig         |  1 +
>  2 files changed, 19 insertions(+)
>  create mode 100644 board/olimex/imx233_olinuxino/linux-wifi.fragment

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

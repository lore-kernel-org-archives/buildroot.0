From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 14:32:11 +0200
Subject: [Buildroot] [PATCH v1] zedboard: Switch to U-Boot 2015.07
In-Reply-To: <20150722122353.11c933fc@pcviktorin.fit.vutbr.cz>
References: <20150722122353.11c933fc@pcviktorin.fit.vutbr.cz>
Message-ID: <20150722143211.2f58211b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jan Viktorin,

On Wed, 22 Jul 2015 12:23:53 +0200, Jan Viktorin wrote:
> The U-Boot v2015.07 is required for successful out-of-the-box
> build for common Xilinx Zynq boards (including Zedboard).
> 
> Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
> ---
>  board/avnet/zedboard/readme.txt | 4 ++--
>  configs/zedboard_defconfig      | 5 ++---
>  2 files changed, 4 insertions(+), 5 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

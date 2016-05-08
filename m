From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 May 2016 15:15:56 +0200
Subject: [Buildroot] [PATCH] imx6ulevk: Use ext4 as filesystem type
In-Reply-To: <1462631538-17941-1-git-send-email-festevam@gmail.com>
References: <1462631538-17941-1-git-send-email-festevam@gmail.com>
Message-ID: <20160508151556.1fc48fce@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  7 May 2016 11:32:18 -0300, Fabio Estevam wrote:
> Extend the filesystem type to ext4.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  board/freescale/imx6ulevk/genimage.cfg | 4 ++--
>  configs/freescale_imx6ulevk_defconfig  | 1 +
>  2 files changed, 3 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

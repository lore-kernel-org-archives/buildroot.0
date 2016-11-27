From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Nov 2016 22:18:07 +0100
Subject: [Buildroot] [PATCH] configs/mx6: Bump to kernel 4.8.11
In-Reply-To: <1480170963-4772-1-git-send-email-festevam@gmail.com>
References: <1480170963-4772-1-git-send-email-festevam@gmail.com>
Message-ID: <20161127221807.4047a7a8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 26 Nov 2016 12:36:03 -0200, Fabio Estevam wrote:
> Kernel 4.8.11 brings commit 5f95e68daae397 ("clk: imx: fix integer overflow
> in AV PLL round rate"), which fixes a PLL calculation bug, so bump to this
> version.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  configs/imx6ulpico_defconfig | 2 +-
>  configs/mx6udoo_defconfig    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 21:58:49 +0200
Subject: [Buildroot] [PATCH 2/4] wandboard: Use kernel version 4.7.3
In-Reply-To: <1473622926-5476-2-git-send-email-festevam@gmail.com>
References: <1473622926-5476-1-git-send-email-festevam@gmail.com>
 <1473622926-5476-2-git-send-email-festevam@gmail.com>
Message-ID: <20160911215849.39e64f97@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 11 Sep 2016 16:42:04 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> Wandboard is well supported in the mainline kernel, so let's switch
> from the 3.14 vendor kernel to 4.7.3 mainline kernel version.
> 
> As mainline use more dts files to support both B1 and C1 versions of the
> board, adjust the dts entries accordingly.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
>  configs/wandboard_defconfig | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

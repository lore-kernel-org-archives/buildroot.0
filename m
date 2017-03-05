From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 21:57:25 +0100
Subject: [Buildroot] [PATCH 4/5] via_imx6_vab820_defconfig: remove
 broken defconfig
In-Reply-To: <20170301083046.13226-4-arnout@mind.be>
References: <20170301083046.13226-1-arnout@mind.be>
 <20170301083046.13226-4-arnout@mind.be>
Message-ID: <20170305215725.1d37233c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 1 Mar 2017 09:30:45 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> This defconfig has been broken due to gcc5 for more than half a year,
> and nobody stepped up to fix it. Remove it, as well as it board
> directory.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Gergely Imreh <imrehg@gmail.com>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> ---
>  board/via/imx6_vab820/genimage.cfg  |  38 ------------
>  board/via/imx6_vab820/post-image.sh |  17 -----
>  board/via/imx6_vab820/readme.txt    | 120 ------------------------------------
>  configs/via_imx6_vab820_defconfig   |  34 ----------
>  4 files changed, 209 deletions(-)
>  delete mode 100644 board/via/imx6_vab820/genimage.cfg
>  delete mode 100755 board/via/imx6_vab820/post-image.sh
>  delete mode 100644 board/via/imx6_vab820/readme.txt
>  delete mode 100644 configs/via_imx6_vab820_defconfig

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

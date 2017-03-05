From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 21:57:30 +0100
Subject: [Buildroot] [PATCH 5/5] altera_*_defconfig: remove broken
 defconfigs
In-Reply-To: <20170301083046.13226-5-arnout@mind.be>
References: <20170301083046.13226-1-arnout@mind.be>
 <20170301083046.13226-5-arnout@mind.be>
Message-ID: <20170305215730.4d0c5d32@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 1 Mar 2017 09:30:46 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> These defconfigs have been broken due to gcc5 for more than half a year,
> and nobody stepped up to fix it. In addition, the rocketboards git
> repository used by these defconfigs hasn't been reachable for more than
> half a year. Finally, these defconfigs don't even use the
> BR2_TARGET_UBOOT_ALTERA_SOCFPGA_IMAGE_CRC option so they are not a
> great example for this family of targets.
> 
> Remove these defconfigs, as well as the board directory. Both are
> removed in a single commit to avoid having an inconsistent readme.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Jan Viktorin <viktorin@rehivetech.com>
> Cc: Charles Manning <cdhmanning@gmail.com>
> Cc: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
> ---
>  board/altera/post-image.sh                         |   8 -
>  board/altera/readme.txt                            | 165 -----
>  .../uboot-sockit-preloader-sample-design.patch     | 820 ---------------------
>  configs/altera_socdk_defconfig                     |  33 -
>  configs/altera_sockit_defconfig                    |  37 -
>  5 files changed, 1063 deletions(-)
>  delete mode 100755 board/altera/post-image.sh
>  delete mode 100644 board/altera/readme.txt
>  delete mode 100644 board/altera/sockit/uboot-sockit-preloader-sample-design.patch
>  delete mode 100644 configs/altera_socdk_defconfig
>  delete mode 100644 configs/altera_sockit_defconfig

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Jun 2017 22:19:27 +0200
Subject: [Buildroot] [PATCH v4 2/6] board: engicam: Rename defconfig
 engicam_imx6qdl_icore_mmc_defconfig
In-Reply-To: <1497857252-8308-3-git-send-email-jteki@openedev.com>
References: <1497857252-8308-1-git-send-email-jteki@openedev.com>
 <1497857252-8308-3-git-send-email-jteki@openedev.com>
Message-ID: <20170619221927.0986c336@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 19 Jun 2017 12:57:28 +0530, Jagan Teki wrote:
> From: Jagan Teki <jagan@amarulasolutions.com>
> 
> Since the board have support for nand, better to explicitly
> name it with mmc.
> 
> engicam_imx6qdl_icore_defconfig => engicam_imx6qdl_icore_mmc_defconfig
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Unless we are going to introduce other configurations for the same
board (to support NAND booting), then I would prefer to keep the name
without the "mmc". The readme.txt can explain that the configuration
supports MMC booting.

Also, in the follow-up patches, please avoid the _mmc_ part in the
defconfig name.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

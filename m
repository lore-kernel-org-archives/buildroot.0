From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Jul 2018 12:01:28 +0200
Subject: [Buildroot] [PATCH v2 2/2] configs/imx7d-sdb: Add new defconfig
In-Reply-To: <1531084579-7949-2-git-send-email-festevam@gmail.com>
References: <1531084579-7949-1-git-send-email-festevam@gmail.com>
 <1531084579-7949-2-git-send-email-festevam@gmail.com>
Message-ID: <20180718120128.2454a930@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  8 Jul 2018 18:16:19 -0300, Fabio Estevam wrote:
> Introduce imx7d-sdb_defconfig that allows booting imx7d-sdb
> board using U-Boot and kernel mainline instead of the
> vendor provided versions.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Changes since v1:
> - None

This was lacking the update to the DEVELOPERS file and to
the .gitlab-ci.yml file, so I fixed that and applied. Thanks!

However, I find the naming a bit strange. If I understand correctly
freescale_imx7dsabresd_defconfig and imx7d-sdb_defconfig are for the
same board, the former using the vendor kernel, the latter using the
mainline kernel. If that's the case, why isn't the defconfig having the
same name, except for the freescale_ prefix ?

Also, the board folder is named "imx7dsdb", which isn't very consistent.

Could you clarify this and perhaps increase the consistency ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 18 Jul 2018 09:21:39 -0300
Subject: [Buildroot] [PATCH v2 2/2] configs/imx7d-sdb: Add new defconfig
In-Reply-To: <20180718120128.2454a930@windsurf>
References: <1531084579-7949-1-git-send-email-festevam@gmail.com>
 <1531084579-7949-2-git-send-email-festevam@gmail.com>
 <20180718120128.2454a930@windsurf>
Message-ID: <CAOMZO5AnV9edLKrhTwchdghONU7=5CONndAjgXLreTkdN1vj8Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Jul 18, 2018 at 7:01 AM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:

> This was lacking the update to the DEVELOPERS file and to
> the .gitlab-ci.yml file, so I fixed that and applied. Thanks!

Ops, thanks for fixing these points!

> However, I find the naming a bit strange. If I understand correctly
> freescale_imx7dsabresd_defconfig and imx7d-sdb_defconfig are for the
> same board, the former using the vendor kernel, the latter using the
> mainline kernel. If that's the case, why isn't the defconfig having the
> same name, except for the freescale_ prefix ?

For boards that use mainline kernel and U-Boot I try to name its
Buildroot defconfig using the same convention used in its device tree:
<soc>-<board>, so that is why I used imx7d-sdb_defconfig.

> Also, the board folder is named "imx7dsdb", which isn't very consistent.

Yes, I can change it to "imx7d-sdb" for better consistency.

Thanks

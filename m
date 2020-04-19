From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 21:44:33 +0200
Subject: [Buildroot] [PATCH 1/1] configs/zynq_qmtech: new defconfig
In-Reply-To: <20200102194120.483202-1-juju@cotds.org>
References: <20200102194120.483202-1-juju@cotds.org>
Message-ID: <20200419214433.51eb92a5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  2 Jan 2020 20:41:20 +0100
Julien Olivain <juju@cotds.org> wrote:

> This patch add support for the low cost QMTECH XC7Z010 starter kit
> board [1].
> 
> [1] http://www.chinaqmtech.com/xilinx_zynq_soc
> 
> Signed-off-by: Martin Chabot <martin.chabot@gmail.com>
> Signed-off-by: Julien Olivain <juju@cotds.org>
> ---
>  .gitlab-ci.yml                                |   1 +
>  DEVELOPERS                                    |   2 +
>  ...0001-DTS-for-QMTech-Zynq-starter-kit.patch | 418 ++++++++++++++++++
>  board/qmtech/zynq/readme.txt                  |  76 ++++
>  configs/zynq_qmtech_defconfig                 |  32 ++
>  5 files changed, 529 insertions(+)
>  create mode 100644 board/qmtech/zynq/patches/linux/0001-DTS-for-QMTech-Zynq-starter-kit.patch
>  create mode 100644 board/qmtech/zynq/readme.txt
>  create mode 100644 configs/zynq_qmtech_defconfig

Sorry for the slow feedback, I've now applied your patch. It would be
good to get the support for this platform in upstream Linux/U-Boot
perhaps?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

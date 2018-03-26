From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Mar 2018 22:39:37 +0200
Subject: [Buildroot] [PATCH v2] configs/arcturus_ucls1012a: new defconfig
In-Reply-To: <20180315210749.14388-1-oleks@arcturusnetworks.com>
References: <20180315210749.14388-1-oleks@arcturusnetworks.com>
Message-ID: <20180326223937.1dd72e92@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 15 Mar 2018 17:07:49 -0400, Oleksandr Zhadan wrote:
> The uCLS1012A-SOM product family (ucls1012a) is an Arcturus Networks Inc.
> 64bit ARM Cortex-A53 class System on Module powered by a NXP QorIQ LS1012A
> Low Power Communication Processor.  This 314 pin MXM3.0/SMARC module card
> contains DDR3, QSPI NOR Flash, eMMC NAND Flash, optional Audio CODEC and is
> available with 1 or 2 Gig-Ethernet PHYs.
> 
> Signed-off-by: Oleksandr Zhadan <oleks@arcturusnetworks.com>
> Signed-off-by: Michael Durrant <mdurrant@arcturusnetworks.com>
> 
> Changes v1 -> v2:
>     - updated kernel and u-boot source repositories to github
> 
> ---
>  DEVELOPERS                                         | 10 +++
>  board/arcturus/aarch64-ucls1012a/post-image.sh     |  6 ++
>  board/arcturus/aarch64-ucls1012a/readme.txt        | 74 ++++++++++++++++++++++
>  .../rootfs_overlay/etc/init.d/S09modload           | 14 ++++
>  configs/arcturus_ucls1012a_defconfig               | 37 +++++++++++
>  5 files changed, 141 insertions(+)
>  create mode 100755 board/arcturus/aarch64-ucls1012a/post-image.sh
>  create mode 100644 board/arcturus/aarch64-ucls1012a/readme.txt
>  create mode 100755 board/arcturus/aarch64-ucls1012a/rootfs_overlay/etc/init.d/S09modload
>  create mode 100644 configs/arcturus_ucls1012a_defconfig

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

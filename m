From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 00:43:53 +0200
Subject: [Buildroot] [PATCH v2] configs/qemu_ppc64_e5500: new defconfig
In-Reply-To: <1522612873-3708-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1522612873-3708-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20180402004353.778a61d5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 Apr 2018 15:01:13 -0500, Matt Weber wrote:
> Adding basic support modeled after the Freescale/NXP T1040RDBD4
> board.
> 
> This target is used to support testing of the bootlin e5500
> toolchain.
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> --
> v1 -> v2
> [Thomas P
>  - Fixed title
>  - Added defconfig to DEVELOPERS
>  - Updated linux config to have more clarification on e500
>  - Option to set kernel headers default (missed this in orig as
>    4.15 is default)
>  - Adjusted linux cfg to support virtio block device and mount
>    a ext fs as the rootfs.  Also setup config to support a net
>    virtio device(assuming this would come up as a bug eventually)
> ---
>  DEVELOPERS                            |  2 ++
>  board/qemu/ppc64-e5500/linux.fragment | 10 ++++++++++
>  board/qemu/ppc64-e5500/readme.txt     |  7 +++++++
>  configs/qemu_ppc64_e5500_defconfig    | 20 ++++++++++++++++++++
>  4 files changed, 39 insertions(+)
>  create mode 100644 board/qemu/ppc64-e5500/linux.fragment
>  create mode 100644 board/qemu/ppc64-e5500/readme.txt
>  create mode 100644 configs/qemu_ppc64_e5500_defconfig

Applied to master after updating the .gitlab-ci.yml file. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

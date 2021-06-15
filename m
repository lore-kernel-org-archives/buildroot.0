From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 15 Jun 2021 15:47:34 +0800
Subject: [Buildroot] [PATCH 2/4] boot/opensbi: introduce
 BR2_TARGET_OPENSBI_FW_FDT_PATH
In-Reply-To: <20210615001750.421889-3-drew@beagleboard.org>
References: <20210615001750.421889-1-drew@beagleboard.org>
 <20210615001750.421889-3-drew@beagleboard.org>
Message-ID: <CAEUhbmW4i9jxkH4NR0_nn-FVfFwXd_7+57u7N0WimSP_46p-xg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Drew,

On Tue, Jun 15, 2021 at 8:18 AM Drew Fustini <drew@beagleboard.org> wrote:
>
> If u-boot CONFIG_OF_SEPARATE is defined [1], then the device tree will

nits: U-Boot

> be built and placed in a u-boot.dtb file alongside u-boot.bin.
>
> When BR2_TARGET_UBOOT_FORMAT_DTB is enabled, buildroot will copy
> u-boot.dtb to $(BINARIES_DIR).
>
> This is useful for RISC-V platforms that want to build OpenSBI with an
> external DTB by using FW_FDT_PATH [2].
>
> [1] https://github.com/lentinj/u-boot/blob/master/doc/README.fdt-control

Please use the official U-Boot github URL: https://github.com/u-boot/u-boot

> [2] https://github.com/riscv/opensbi/blob/master/docs/firmware/fw.md
>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---
>  boot/opensbi/Config.in  | 10 ++++++++++
>  boot/opensbi/opensbi.mk |  3 +++
>  2 files changed, 13 insertions(+)
>

Otherwise,
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

Regards,
Bin

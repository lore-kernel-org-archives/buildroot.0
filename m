From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 12 Mar 2020 09:50:50 +0800
Subject: [Buildroot] [PATCH] configs/qemu_riscv{32,
 64}_virt_defconfig: Remove BR2_TARGET_GENERIC_GETTY_PORT
In-Reply-To: <1583583630-25647-1-git-send-email-bmeng.cn@gmail.com>
References: <1583583630-25647-1-git-send-email-bmeng.cn@gmail.com>
Message-ID: <CAEUhbmV03BhiZnp9GgJRMZB2JW9C4mjNu7ALN4hc60T=6CBNuw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Mar 7, 2020 at 8:20 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Currently BR2_TARGET_GENERIC_GETTY_PORT is set to ttyS0 in both
> qemu_riscv32_virt and qemu_riscv64_virt defconfig files. This
> limits usecases when the same one rootfs could be used on QEMU
> 'sifive_u' machine and SiFive HiFive Unleashed board.
>
> Remove it so that the default boot console can be used.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>
>  configs/qemu_riscv32_virt_defconfig | 1 -
>  configs/qemu_riscv64_virt_defconfig | 1 -
>  2 files changed, 2 deletions(-)
>

Ping?

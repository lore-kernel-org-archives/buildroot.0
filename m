From: bbacha <bbacha@accuratetechnologies.com>
Date: Tue, 16 Jul 2019 15:38:59 -0500 (CDT)
Subject: [Buildroot] Buildroot image failed with external toolchain from
 crosstool-ng
Message-ID: <1563309539424-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I am using freescale_imx8mqevk_defconfig which selects
rel_imx_4.14.78_1.0.0_ga kernel version from
https://source.codeaurora.org/external/imx/linux-imx and external toolchain
generated from crosstool-ng (Kernel: 4.14.x and Glibc 2.29)

Gives error
FATAL: kernel too old
[    4.072195] Kernel panic - not syncing: Attempted to kill init!
exitcode=0x00007f00
[    4.072195]
[    4.081333] CPU: 1 PID: 1 Comm: init Not tainted 4.14.78 #1
[    4.086905] Hardware name: Freescale i.MX8MQ EVK (DT)
[    4.091956] Call trace:
[    4.094411] [<ffff000008089b50>] dump_backtrace+0x0/0x3b0
[    4.099814] [<ffff000008089f14>] show_stack+0x14/0x20
[    4.104869] [<ffff000008d80b10>] dump_stack+0x9c/0xbc
[    4.109923] [<ffff0000080ce588>] panic+0x11c/0x278
[    4.114717] [<ffff0000080d2788>] do_exit+0x918/0x950
[    4.119681] [<ffff0000080d2824>] do_group_exit+0x34/0xa0
[    4.124992] [<ffff0000080d28a0>] __wake_up_parent+0x0/0x30
[    4.130475] Exception stack(0xffff00000803bec0 to 0xffff00000803c000).

Thanks,
Bharat




--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/

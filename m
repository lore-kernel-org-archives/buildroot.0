From: Adrian martinez munera <adrianmartinezmunera@gmail.com>
Date: Wed, 4 Dec 2019 09:23:15 +0100
Subject: [Buildroot] Zynqmp ZCU-102 Xilinx
In-Reply-To: <CADDW7LPZ+oD9NzjqvbjVBDYj59K_6q1d8beoqwyQ==jFNTq=KA@mail.gmail.com>
References: <CADDW7LPbh8ep74a5kcu1CZQuaFxuUGyCUxuJT6uo6Y=m9ftmOA@mail.gmail.com>
 <d46c58a9-4b07-878f-b638-1a4d1554e9b1@lucaceresoli.net>
 <CADDW7LPZ+oD9NzjqvbjVBDYj59K_6q1d8beoqwyQ==jFNTq=KA@mail.gmail.com>
Message-ID: <CADDW7LNm+aXWZ5JpqSPtkcFkhyixtHtdMf77s4ecNpx_aWe_6Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!!
I attach the boot log:








































































































*U-Boot SPL 2018.01 (Dec 04 2019 - 08:25:44)EL Level:       EL3Trying to
boot from MMC1reading u-boot.binreading atf-uboot.ubreading
atf-uboot.ubNOTICE:  ATF running on XCZU9EG/silicon v3/RTL5.1 at
0xfffea000, with PMU firmweNOTICE:  BL31: Secure code at 0x0NOTICE:  BL31:
Non secure code at 0x8000000NOTICE:  BL31: v1.5(release):NOTICE:  BL31:
Built : 08:25:34, Dec  4 2019PMUFW:  v1.1

                                                  U-Boot 2018.01 (Dec 04
2019 - 08:25:44 +0100) Xilinx ZynqMP ZCU102 rev1.0
                                                              I2C:   ready
                                                                   DRAM:  4
GiB                                                                    EL
Level:       EL2
  Chip ID:        zu9eg
      MMC:   sdhci at ff170000: 0 (SD)
          *** Warning - bad CRC, using default environment

                    In:    serial at ff000000
                         Out:   serial at ff000000
                             Err:   serial at ff000000
                                 Bootmode: LVL_SHFT_SD_MODE1
                                      Net:   ZYNQ GEM: ff0e0000, phyaddr c,
interface rgmii-id
                                              Warning: ethernet at ff0e0000
(eth0) using random MAC address - 0a:3a:e6:2f:ab:08  eth0:
ethernet at ff0e0000
Hit any key to stop autoboot:  0
     switch to partitions #0, OK
          mmc0 is current device
               Device: sdhci at ff170000
                   Manufacturer ID: 3
                       OEM: 5344
                            Name: SL16G
                                Tran Speed: 50000000
                                     Rd Block Len: 512
                                          SD version 3.0
                                               High Capacity: Yes
                                                   Capacity: 14.8 GiB
                                                       Bus Width: 4-bit
                                                           Erase Group
Size: 512 Bytes                                                     reading
system.dtb
 37887 bytes read in 15 ms (2.4 MiB/s)
      reading Image
          14825984 bytes read in 982 ms (14.4 MiB/s)
               ## Flattened Device Tree blob at 04000000
                       Booting using the fdt blob at 0x4000000
                            Loading Device Tree to 000000000fff3000, end
000000000ffff3fe ... OK
                                    Starting kernel ...

                                            [    0.000000] Booting Linux on
physical CPU 0x0                                [    0.000000] Linux
version 4.14.0 (adrian at adrian) (gcc version 7.4.0 (Buildro9[    0.000000]
Boot CPU: AArch64 Processor [410fd034]                           [
 0.000000] Machine model: ZynqMP ZCU102 Rev1.0
 [    0.000000] earlycon: cdns0 at MMIO 0x00000000ff000000 (options
'115200n8')  [    0.000000] bootconsole [cdns0] enabled
                 [    0.000000] efi: Getting EFI parameters from FDT:
                     [    0.000000] efi: UEFI not found.
                          [    0.000000] cma: Reserved 256 MiB at
0x0000000070000000                      [    0.000000] psci: probing for
conduit method from DT.                        [    0.000000] psci:
PSCIv1.1 detected in firmware.                             [    0.000000]
psci: Using standard PSCI v0.2 function IDs                      [
 0.000000] psci: MIGRATE_INFO_TYPE not supported.
[    0.000000] percpu: Embedded 21 pages/cpu @ffffffc87ff66000 s45080 r8192
d326[    0.000000] Detected VIPT I-cache on CPU0
         [    0.000000] CPU features: enabling workaround for ARM erratum
845719         [    0.000000] Built 1 zonelists, mobility grouping on.
Total pages: 1034240   [    0.000000] Kernel command line: earlycon
clk_ignore_unused root=/dev/mmcblkt[    0.000000] PID hash table entries:
4096 (order: 3, 32768 bytes)             [    0.000000] Dentry cache hash
table entries: 524288 (order: 10, 4194304 byte)[    0.000000] Inode-cache
hash table entries: 262144 (order: 9, 2097152 bytes) [    0.000000]
software IO TLB [mem 0x6bfff000-0x6ffff000] (64MB) mapped at [ff][
 0.000000] Memory: 3785368K/4194304K available (10108K kernel code, 654K
rw)[    0.000000] Virtual kernel memory layout:
       [    0.000000]     modules : 0xffffff8000000000 - 0xffffff8008000000
  (   128 )[    0.000000]     vmalloc : 0xffffff8008000000 -
0xffffffbebfff0000   (   250 )[    0.000000]       .text :
0xffffff8008080000 - 0xffffff8008a60000   ( 10112 )[    0.000000]
.rodata : 0xffffff8008a60000 - 0xffffff8008d80000   (  3200 )[    0.000000]
      .init : 0xffffff8008d80000 - 0xffffff8008e00000   (   512 )[
 0.000000]       .data : 0xffffff8008e00000 - 0xffffff8008ea3a00   (   655
)[    0.000000]        .bss : 0xffffff8008ea3a00 - 0xffffff80090bf030   (
 2158 )[    0.000000]     fixed   : 0xffffffbefe7fd000 - 0xffffffbefec00000
  (  4108 )[    0.000000]     PCI I/O : 0xffffffbefee00000 -
0xffffffbeffe00000   (    16 )[    0.000000]     vmemmap :
0xffffffbf00000000 - 0xffffffc000000000   (     4 )[    0.000000]
    0xffffffbf00000000 - 0xffffffbf1dc00000   (   476 )[    0.000000]
memory  : 0xffffffc000000000 - 0xffffffc880000000   ( 34816 )[    0.000000]
Hierarchical RCU implementation.                                 [
 0.000000]  RCU event tracing is enabled.
[    0.000000]  RCU restricting CPUs from NR_CPUS=8 to nr_cpu_ids=4.
     [    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=16,
nr_cpu_ids=4     [    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated
irqs: 0                   [    0.000000] GIC: Adjusting CPU interface base
to 0x00000000f902f000          [    0.000000] GIC: Using split
EOI/Deactivate mode                             [    0.000000] arch_timer:
cp15 timer(s) running at 100.00MHz (phys).           [    0.000000]
clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycless[
 0.000003] sched_clock: 56 bits at 100MHz, resolution 10ns, wraps every
439s[    0.008378] Console: colour dummy device 80x25
        [    0.012463] console [tty0] enabled
            [    0.015829] bootconsole [cdns0] disabled    *

El mar., 3 dic. 2019 a las 9:44, Adrian martinez munera (<
adrianmartinezmunera@gmail.com>) escribi?:

> Hi Luca,
> thanks for your answer!
> How I said to Thomas, I'm trying to compile a Linux image to my ZCU-102
> with EPICS (https://epics.anl.gov). But, as first step, I'd want build a
> simple Linux image, all of this using Buildroot.
> Using yours steps, I've created a pmufw.bin with your builder and the
> 'pm_cfg_obj.c', created by the Vivado project (xilpm library enabled).
> Now I've a new two errors at the boot:
> 1. boot console [cdns0] disabled
> 2. The root file system is empty
>
> *defconfig* file that I'm using:
>
> BR2_aarch64=y
> BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches/"
> BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
> BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
> BR2_LINUX_KERNEL=y
> BR2_LINUX_KERNEL_CUSTOM_GIT=y
> BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/Xilinx/linux-xlnx.git"
> BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xilinx-v2018.3"
> BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
> BR2_LINUX_KERNEL_DTS_SUPPORT=y
> BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu102-rev1.0"
> BR2_TARGET_ROOTFS_EXT2=y
> BR2_TARGET_ROOTFS_EXT2_4=y
> # BR2_TARGET_ROOTFS_TAR is not set
> BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="
> https://github.com/ARM-software/arm-trusted-firmware.git"
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v1.5"
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
> BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
> BR2_TARGET_UBOOT=y
> BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> BR2_TARGET_UBOOT_CUSTOM_GIT=y
> BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/xilinx/u-boot-xlnx.git"
>
> BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="228801a215909365ae1dcdd799034195ad7264f7"
> BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_zcu102_rev1_0"
> BR2_TARGET_UBOOT_NEEDS_DTC=y
> BR2_TARGET_UBOOT_SPL=y
> BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
> BR2_TARGET_UBOOT_ZYNQMP=y
>
> BR2_TARGET_UBOOT_ZYNQMP_PMUFW="/home/adrian/Documents/ZCU-102/pmufw_builder/zynqmp-pmufw-builder/pmufw.bin"
> BR2_PACKAGE_HOST_DOSFSTOOLS=y
> BR2_PACKAGE_HOST_GENIMAGE=y
> BR2_PACKAGE_HOST_MTOOLS=y
>
> El mar., 26 nov. 2019 a las 17:49, Luca Ceresoli (<luca@lucaceresoli.net>)
> escribi?:
>
>> Hi Adrian,
>>
>> On 20/11/19 09:21, Adrian martinez munera wrote:
>> > Hi,
>> > I'm not sure if I have to write you by this mail.
>> >
>> > I'm using buildroot to create a Linux image to my ZCU-102, adding EPICS.
>> >
>> > My first attempt are been build  a simple Linux image, without EPICS,
>> > but it doesn't work.
>> >
>> > ?Could you help me? ?Could you give me all of necessary files to build
>> > the image?
>>
>> Thomas already replied with some objections, and I agree you should
>> explain better your problem.
>>
>> However, as setting up booting is more complex on ZynqMP platforms than
>> in other ones, here are a few notes to address booting. They could be
>> useful for other people as well.
>>
>> Buildroot has a defconfig for the ZCU106 board, you can take that as a
>> starting point. However some things have changed since that was added,
>> so I recommend a better approach now.
>>
>> I assume you already have a Vivado project implementing your FPGA
>> design. Even a project with a completely empty FPGA is OK, what matters
>> is that you configure the "ZynqMP block" appropriately for the board
>> (the Vivado wizard helps you in starting from a default configuration
>> with proper DDR timings, among others).
>>
>> With the Vivado project you can start the Xilinx XSDK to produce a bsp
>> (don't forget to enable the xilpm library in the wizard). The xilpm
>> library in the generated bsp has a file called pm_cfg_obj.c. It's the
>> "configuration object" that tells the PMU FW how to configure peripherals.
>>
>> Now you could go for the "old" approach, the one used for the zcu106
>> defconfig currently in Buildroot: using zynqmp-pmufw-builder [0] you can
>> generate a pmufw.bin that contains your configuration object hard-coded.
>> This is how the pmufw binaries in zynqmp-pmufw-binaries [1], and used in
>> Buildroot for ZCU106, have been generated.
>>
>> But I rather suggest to use the "new" approach. U-Boot SPL since
>> v2019.10 can load the PMUFW configuration object at runtime (just like
>> Xilinx FSBL does). In this case you can avoid hard-coding the config
>> object into the pmufw binary, and use a "standard" PMUFW that works for
>> any ZynqMP board. The v2018.3 PMUFW in [1] has been built in this way.
>>
>> For additional explanations on the "new" approach see [2]. I wrote some
>> suggestions on how to implement such a workflow for yocto on the
>> meta-xilinx mailing list [3], the underlying idea should apply to
>> Buildroot as well.
>>
>> I hope this is useful for you. As pointed out by Thomas, your question
>> is not very precise, so please add more details on exactly what you want
>> to achieve, what you tried and how it failed. Somebody will probably be
>> able to help you better.
>>
>> [0] https://github.com/lucaceresoli/zynqmp-pmufw-builder
>> [1] https://github.com/lucaceresoli/zynqmp-pmufw-binaries
>> [2] https://lucaceresoli.net/zynqmp-uboot-spl-pmufw-cfg-load/
>> [3] https://lists.yoctoproject.org/g/meta-xilinx/message/4570
>>
>> --
>> Luca
>>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191204/8ae921a9/attachment.html>

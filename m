From: Drasko DRASKOVIC <drasko.draskovic@gmail.com>
Date: Mon, 20 Jan 2014 10:13:43 +0100
Subject: [Buildroot] uImage for MIPS architecture
Message-ID: <CAEk6gTCvgeb5aP88O_ZSN9Y0uqbB+AaFMYm8cW1syd+PR0eokw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
in linux/Config.in I can see:

config BR2_LINUX_KERNEL_UIMAGE
bool "uImage"
depends on BR2_arm || BR2_armeb || BR2_bfin || BR2_powerpc ||
BR2_avr32 || BR2_sh || BR2_sh64
select BR2_LINUX_KERNEL_UBOOT_IMAGE

Why MIPS architecture is not supported?

Best regards,
Drasko

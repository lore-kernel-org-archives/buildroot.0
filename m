From: Daniel.Li <lida_mail@163.com>
Date: Tue, 25 Aug 2009 05:29:11 +0800
Subject: [Buildroot] How can I disable syslogd info output to serial port?
Message-ID: <1251149351.32252.2.camel@daniel-laptop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear All,

I have just build a ramdisk, and when booting, it will output a lot of
info, I wanna disable those info at serial port. How can I config it?



RAMDISK: Compressed image found at block 0
EXT2-fs warning: checktime reached, running e2fsck is recommended
VFS: Mounted root (ext2 filesystem).
Freeing init memory: 136K
Dec 28 02:20:35 uclibc syslog.info syslogd started: BusyBox v1.14.3
Dec 28 02:20:35 uclibc daemon.info init: starting pid 289, tty
'/dev/null': '/sbin/klogd -n'
Dec 28 02:20:35 uclibc user.notice kernel: klogd started: BusyBox
v1.14.3 (2009-08-21 14:09:34 CST)
Dec 28 02:20:35 uclibc user.notice kernel: Linux version
2.6.22.18-topkick-1-0-0-2 (daniel at samba-100) (gcc version 3.4.4
(release) (CodeSourcery ARM 2005q3-2)) #19 Mon Aug 24 16:56:07 EDT 2009
Dec 28 02:20:35 uclibc user.warn kernel: CPU: ARM926EJ-S [56251311]
revision 1 (ARMv5TE), cr=00053977
Dec 28 02:20:35 uclibc user.warn kernel: Machine: Feroceon-KW
Dec 28 02:20:35 uclibc user.warn kernel: Using UBoot passing parameters
structure
Dec 28 02:20:35 uclibc user.warn kernel: Memory policy: ECC disabled,
Data cache writeback
Dec 28 02:20:35 uclibc user.debug kernel: On node 0 totalpages: 65536
Dec 28 02:20:35 uclibc user.debug kernel:   DMA zone: 512 pages used for
memmap
Dec 28 02:20:35 uclibc user.debug kernel:   DMA zone: 0 pages reserved
Dec 28 02:20:35 uclibc user.debug kernel:   DMA zone: 65024 pages, LIFO
batch:15
Dec 28 02:20:35 uclibc daemon.info init: starting pid 291, tty
'/dev/tty3': '/usr/bin/tail -f /var/log/messages'
Dec 28 02:20:35 uclibc user.info kernel: ehci_marvell
ehci_marvell.70059: new USB bus registered, assigned bus number 1
Dec 28 02:20:35 uclibc user.info kernel: ehci_marvell
ehci_marvell.70059: irq 19, io base 0xf1050100
Dec 28 02:20:35 uclibc user.info kernel: ehci_marvell
ehci_marvell.70059: USB 2.0 started, EHCI 1.00, driver 10 Dec 2004
Dec 28 02:20:35 uclibc user.info kernel: usb usb1: configuration #1
chosen from 1 choice
Dec 28 02:20:35 uclibc user.info kernel: hub 1-0:1.0: USB hub found
Dec 28 02:20:35 uclibc user.info kernel: hub 1-0:1.0: 1 port detected
Dec 28 02:20:35 uclibc user.debug kernel: ohci_hcd: 2006 August 04 USB
1.1 'Open' Host Controller (OHCI) Driver
Dec 28 02:20:35 uclibc user.info kernel: usbcore: registered new
interface driver usblp
Dec 28 02:20:35 uclibc user.info kernel: drivers/usb/class/usblp.c:
v0.13: USB Printer Device Class driver
Dec 28 02:20:35 uclibc user.info kernel: Initializing USB Mass Storage
driver...
Dec 28 02:20:35 uclibc user.info kernel: usbcore: registered new
interface driver usb-storage
Dec 28 02:20:36 uclibc daemon.info init: process '/usr/bin/tail
-f /var/log/messages' (pid 291) exited. Scheduling for restart.
Dec 28 02:20:36 uclibc daemon.info init: starting pid 296, tty
'/dev/tty3': '/usr/bin/tail -f /var/log/messages'
Dec 28 02:20:37 uclibc daemon.info init: process '/usr/bin/tail
-f /var/log/messages' (pid 296) exited. Scheduling for restart.
Dec 28 02:20:37 uclibc daemon.info init: starting pid 301, tty
'/dev/tty3': '/usr/bin/tail -f /var/log/messages'
-- 
Daniel.Li <lida_mail@163.com>
PALFocus (http://palfocus.oicp.net)
